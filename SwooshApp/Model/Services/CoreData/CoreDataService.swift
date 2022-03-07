//
//  CoreDataService.swift
//  SwooshApp
//
//  Created by Ma7rous on 3/3/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataService {
    
    static let shared = CoreDataService()
/*==============================================================*/
    //MARK: Saving Data to CoreData
    func savingToCoreData(league: League){
        //1
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //2
        let managedContext = appDelegate.persistentContainer.viewContext
        //3
        let entity = NSEntityDescription.entity(forEntityName: "MyLeagues", in: managedContext)
        //4
        let temp = NSManagedObject(entity: entity!, insertInto: managedContext)
        temp.setValue(league.idLeague, forKey: "idLeague")
        temp.setValue(league.strBadge, forKey: "strBadge")
        temp.setValue(league.strCountry, forKey: "strCountry")
        temp.setValue(league.strLeague, forKey: "strLeague")
        temp.setValue(league.strLeagueAlternate, forKey: "strLeagueAlternate")
        temp.setValue(league.strSport, forKey: "strSport")
        temp.setValue(league.strYoutube, forKey: "strYoutube")
        
        //5
        do {
            try managedContext.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
/*==============================================================*/
    //MARK: Fetching Data From CoreData
    func fetchDataFromCoreData() -> [League]? {
        var leaguesArray = [League]()
        
        //1
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //2
        let managedContext = appDelegate.persistentContainer.viewContext
        //3
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MyLeagues")
        //4
            //set predicates
        
        //5
        do {
            let movs = try managedContext.fetch(fetchRequest)
            for item in movs {
                let myLeague = League(idLeague: item.value(forKey: "idLeague") as? String,
                                     strSport: item.value(forKey: "strSport") as? String,
                                     strLeague: item.value(forKey: "strLeague") as? String,
                                     strLeagueAlternate: item.value(forKey: "strLeagueAlternate") as? String,
                                     strCountry: item.value(forKey: "strCountry") as? String,
                                     strYoutube: item.value(forKey: "strYoutube") as? String,
                                     strBadge: item.value(forKey: "strBadge") as? String)
                leaguesArray.append(myLeague)
            }
        } catch let error as NSError {
            print(error)
        }
        return leaguesArray
    }
    
    
/*==============================================================*/
    //MARK: Deleting Data From CoreData
    func deleteDataFromCoreData(league: League) {
        //1
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //2
        // Get a reference to a NSPersistentStoreCoordinator
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MyLeagues")
        //4
        //set predicates
        let leaguePredicate = NSPredicate(format: "idLeague == %@", league.idLeague!)
        fetchRequest.predicate = leaguePredicate
        //5
        // Delete each existing persistent store
        do {
            let temp = try managedContext.fetch(fetchRequest)
            for item in temp {
                managedContext.delete(item)
                
            }
            try managedContext.save()
        }catch let error as NSError{
            print(error)
        }
    }
    
    
}

