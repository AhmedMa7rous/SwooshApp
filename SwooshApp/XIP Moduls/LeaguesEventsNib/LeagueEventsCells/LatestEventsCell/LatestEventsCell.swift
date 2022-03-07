//
//  LatestEventsCell.swift
//  SwooshApp
//
//  Created by Ma7rous on 3/5/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import UIKit

class LatestEventsCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

/*=========================================================*/
    //MARK: Constants & Variables
    var leagueLatestEvents = [Event]()
    
    
/*=========================================================*/
    //MARK: Outlet Connections
    @IBOutlet weak var latestCollectionView: UICollectionView!
    
    
/*===============================================================*/
    //MARK: Latest Events Collection View Functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return leagueLatestEvents.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LatestCollectionCell.identifier, for: indexPath) as! LatestCollectionCell
        let event = leagueLatestEvents[indexPath.row]
        cell.setUpUi(forEvent: event)
        cell.contentView.layer.cornerRadius = 15
        return cell
            
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height )
           
    }
        
/*===============================================================*/
    //MARK: Services Functions
    func eventsIntialization() {
        
        latestCollectionView.register(LatestCollectionCell.nib, forCellWithReuseIdentifier: LatestCollectionCell.identifier)
        latestCollectionView.delegate = self
        latestCollectionView.dataSource = self
            
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
            NetworkService.shared.getLatestEvents(forLeague: EventsTableViewController.leagueId, onSuccess: { (result) in
                self.leagueLatestEvents = result.events!
                self.latestCollectionView.reloadData()
            }) { (errorMessage) in
                debugPrint(errorMessage)
            }
        }
            
    }
    
}
