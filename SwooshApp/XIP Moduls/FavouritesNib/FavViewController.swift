//
//  FavViewController.swift
//  SwooshApp
//
//  Created by Ma7rous on 3/7/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import UIKit
import CoreData

class FavViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var favouritesArray = [League]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(FavoritesTableViewCell.nib, forCellReuseIdentifier: FavoritesTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
       
    }
    
/*=======================================================*/
    // MARK: - Table View Functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouritesArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.identifier, for: indexPath) as! FavoritesTableViewCell
        
        let league = favouritesArray[indexPath.row]
            
        cell.updateCellUi(forCell: cell, andLeague: league)
        
            
        return cell
    }
        
   /* func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = self.storyboard?.instantiateViewController(identifier: "events") as! EventsTableViewController
        vc.leagueName = leaguesArray[indexPath.row].strLeague!
        vc.leagueId = Int(leaguesArray[indexPath.row].idLeague!)!
        self.navigationController?.pushViewController(vc, animated: true)
    }*/
        
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
        
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let temp = favouritesArray[indexPath.row]
            self.favouritesArray.remove(at: indexPath.row)
            CoreDataService.shared.deleteDataFromCoreData(league: temp)
            self.tableView.reloadData()
            //tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
        
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
            
/*===================================================================*/
    //MARK: Services Functions
    func updateUI() {
        
        guard let temp = CoreDataService.shared.fetchDataFromCoreData() else {return}
        self.favouritesArray = temp
        self.tableView.reloadData()
    }

}
