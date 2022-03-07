//
//  EventsTableViewController.swift
//  SwooshApp
//
//  Created by Ma7rous on 3/5/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import UIKit

class EventsTableViewController: UITableViewController {
/*=========================================================*/
    //MARK: Constants & Variables
    var leagueUpcomingEvents = [Event]()
    var leagueLatestEvents = [Event]()
    var leagueTeams = [Team]()
    static var leagueName = ""
    static var leagueId = 0
    let sections = ["Upcoming Events","Latest Events","Teams"]
/*=========================================================*/
    //MARK: Outlet Connections
    
/*=========================================================*/
    //MARK: VC LifeCycle Functions
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UpcomingEventsCell.nib, forCellReuseIdentifier: UpcomingEventsCell.identifier)
        tableView.register(LatestEventsCell.nib, forCellReuseIdentifier: LatestEventsCell.identifier)
        tableView.register(TeamsCell.nib, forCellReuseIdentifier: TeamsCell.identifier)
        
        
        //self.configureCollectionView()
    }
/*==============================================================*/
    // MARK: - Table view Functions

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        switch (indexPath.section) {
           case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingEventsCell.identifier, for: indexPath) as! UpcomingEventsCell
            cell.getData()
            cell.eventsIntialization()
            return cell
           case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: LatestEventsCell.identifier, for: indexPath) as! LatestEventsCell
            cell.getData()
            cell.eventsIntialization()
            return cell
           default:
            let cell = tableView.dequeueReusableCell(withIdentifier: TeamsCell.identifier, for: indexPath) as! TeamsCell
            cell.getData()
            cell.eventsIntialization()
            cell.orgin = self
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        switch (indexPath.section) {
           case 0:
            return tableView.frame.size.height * 0.3
           case 1:
            return tableView.frame.size.height * 0.3
           default:
            return tableView.frame.size.height * 0.2 - 60
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 40
    }
   
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header:UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.contentView.backgroundColor = #colorLiteral(red: 0.09353107959, green: 0.1251952648, blue: 0.1089309826, alpha: 0.8990528682)
        header.textLabel!.text = sections[section]
        header.textLabel!.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        header.textLabel!.font = UIFont.boldSystemFont(ofSize: 20)
        header.textLabel!.frame = header.frame
        header.textLabel!.textAlignment = NSTextAlignment.center
    }

/*===============================================================*/
    //MARK: Services Functions
   
/*===============================================================*/
    //MARK: Latest Events Collection View Functions

    
/*===============================================================*/
    //MARK: Teams Collection View Functions
    
    
    
}
