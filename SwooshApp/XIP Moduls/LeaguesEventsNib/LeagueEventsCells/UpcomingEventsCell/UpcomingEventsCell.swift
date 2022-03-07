//
//  UpcomingEventsCell.swift
//  SwooshApp
//
//  Created by Ma7rous on 3/5/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import UIKit

class UpcomingEventsCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
/*=========================================================*/
    //MARK: Constants & Variables
    var leagueUpcomingEvents = [Event]()
    
    
    
/*=========================================================*/
    //MARK: Outlet Connections
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    
/*========================================================*/
    override func awakeFromNib() {
        //self.eventsIntialization()
    }
/*===============================================================*/
    //MARK: Upcoming Events Collection View Functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return leagueUpcomingEvents.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionCell.identifier, for: indexPath) as! UpcomingCollectionCell
        let event = leagueUpcomingEvents[indexPath.row]
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
        upcomingCollectionView.register(UpcomingCollectionCell.nib, forCellWithReuseIdentifier: UpcomingCollectionCell.identifier)
        upcomingCollectionView.delegate = self
        upcomingCollectionView.dataSource = self
    }
        
    func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)

        //let size = (view.frame.size.width - 4) / 3
        //layout.itemSize = CGSize(width: size, height: size)

        self.upcomingCollectionView.collectionViewLayout = layout
    }
        
    func getData() {
            
        NetworkService.shared.getUpcomingEvents(forLeague: EventsTableViewController.leagueName, onSuccess: { (result) in
            self.leagueUpcomingEvents = result.event!
            self.upcomingCollectionView.reloadData()
        }) { (errorMessage) in
            debugPrint(errorMessage)
        }
            
    }
    
}
