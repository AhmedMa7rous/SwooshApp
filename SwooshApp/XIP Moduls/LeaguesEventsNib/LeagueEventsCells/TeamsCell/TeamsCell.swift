//
//  TeamsCell.swift
//  SwooshApp
//
//  Created by Ma7rous on 3/5/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import UIKit

class TeamsCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
/*=========================================================*/
    //MARK: Constants & Variables
    var leagueTeams = [Team]()
    var orgin: UIViewController?
    
    
/*=========================================================*/
    //MARK: Outlet Connections
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
/*===============================================================*/
    //MARK: Upcoming Events Collection View Functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return leagueTeams.count
        
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamsCollectionCell.identifier, for: indexPath) as! TeamsCollectionCell
        let team = leagueTeams[indexPath.row]
        cell.setUpUi(forEvent: team)
        cell.contentView.layer.cornerRadius = 15
        return cell
        
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width * 0.25, height: collectionView.frame.size.height * 0.9)
        
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.teamsCollectionView {
            let vc = TeamDetailsViewController()
            vc.team = leagueTeams[indexPath.row]
            orgin?.navigationController?.pushViewController(vc, animated: true)
        }
    }
/*===============================================================*/
    //MARK: Services Functions
    func eventsIntialization() {
            
        teamsCollectionView.register(TeamsCollectionCell.nib, forCellWithReuseIdentifier: TeamsCollectionCell.identifier)
        teamsCollectionView.delegate = self
        teamsCollectionView.dataSource = self
    }
        
    func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)

       // let size = (view.frame.size.width - 4) / 3
       // layout.itemSize = CGSize(width: size, height: size)
       // self.upcomingCollectionView.collectionViewLayout = layout
    }
    
    func getData() {
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            NetworkService.shared.getTeams(forLeague: EventsTableViewController.leagueName, onSuccess: { (result) in
                self.leagueTeams = result.teams
                self.teamsCollectionView.reloadData()
            }) { (errorMessage) in
                debugPrint(errorMessage)
            }
        }
    }
    
    func navigatToTeamDetails(fromViewController: EventsTableViewController, toViewController: TeamDetailsViewController) {
        fromViewController.navigationController?.pushViewController(toViewController, animated: true)
    }
    
}
