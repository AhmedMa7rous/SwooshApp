//
//  LeaguesViewController.swift
//  SwooshApp
//
//  Created by Ma7rous on 3/1/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import UIKit
import FavoriteButton

class LeaguesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

/*========================================================*/
    //MARK: Constants & Variables
    var sportName = ""
    var inFavourites = "no"
    var indexer = 0
    var leaguesArray = [League]()
/*========================================================*/
    //MARK: Outlet Connections
    @IBOutlet weak var leaguesTableView: UITableView!
    @IBOutlet weak var favouritesStateLbl: UILabel!
    @IBOutlet weak var favouriteView: UIView!
    
/*========================================================*/
    //MARK: ViewController Life Cycle Functions
    override func viewWillAppear(_ animated: Bool) {
        self.updateUi()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        leaguesTableView.register(LeagueTableViewCell.nib, forCellReuseIdentifier: LeagueTableViewCell.identifier)
        leaguesTableView.delegate = self
        leaguesTableView.dataSource = self
        favouritesStateLbl.isHidden = true
        favouriteView.isHidden = true
    }
    
/*===================================================================*/
    //MARK: Action Connections
    @objc func addToFavourites(sender: FavoriteButton) {
        let temp = leaguesArray[sender.tag]
        if sender.isSelected == true {
            self.showFavouriteState(state: "save")
            //TODO: Save league in CoreData and add to favourites Controller
            print("save")
            CoreDataService.shared.savingToCoreData(league: temp)
        } else {
            self.showFavouriteState(state: "delete")
            //TODO: Delete League from CoreData and favourites controller
            CoreDataService.shared.deleteDataFromCoreData(league: temp)
            print("delete")
        }
    
    }
    
    
    
/*=======================================================*/
    // MARK: - Table View Functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaguesArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LeagueTableViewCell.identifier, for: indexPath) as! LeagueTableViewCell
    
        let league = leaguesArray[indexPath.row]
        
        cell.updateCellUi(forCell: cell, andLeague: league)
        cell.favouriteBtn.tag = indexPath.row
        cell.favouriteBtn.addTarget(self, action: #selector(addToFavourites(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = EventsTableViewController()
        EventsTableViewController.leagueName = leaguesArray[indexPath.row].strLeague!
        EventsTableViewController.leagueId = Int(leaguesArray[indexPath.row].idLeague!)!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.leaguesArray.remove(at: indexPath.row)
            self.leaguesTableView.reloadData()
            //tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
        
/*===================================================================*/
    //MARK: Services Functions
    func updateUi() {
        NetworkService.shared.getLeagues(forSport: sportName, onSuccess: { (Leagues) in
            self.leaguesArray = Leagues.countrys!
            self.leaguesTableView.reloadData()
        }) { (errorMessage) in
            debugPrint(errorMessage)
        }
    }
     
    func showFavouriteState(state: String) {
        self.favouritesStateLbl.layer.cornerRadius = 15
        UIView.animate(withDuration: 1, delay: 0, options: [.transitionCurlUp], animations: {
            if state == "delete" {
                self.favouriteView.isHidden = false
                self.favouriteView.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                self.favouritesStateLbl.isHidden = false
                self.favouritesStateLbl.text = "League Deleted From Favourites!"
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.favouritesStateLbl.isHidden = true
                    self.favouriteView.isHidden = true
                }
            }else if state == "save" {
                self.favouriteView.isHidden = false
                self.favouriteView.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
                self.favouritesStateLbl.isHidden = false
                self.favouritesStateLbl.text = "League Added To Favourites!"
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.favouritesStateLbl.isHidden = true
                    self.favouriteView.isHidden = true
                }
            }
        }, completion: nil)
    }
}
