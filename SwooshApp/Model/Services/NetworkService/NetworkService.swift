//
//  NetworkService.swift
//  SwooshApp
//
//  Created by Ma7rous on 2/24/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import Foundation
import UIKit

let reachability = try! Reachability()


class NetworkService{
    
    static let shared = NetworkService()
    let URL_BASE = "https://www.thesportsdb.com/api/v1/json/2/"
    let session = URLSession(configuration: .default)
    
/*==============================================================*/
    //MARK: Get The Sports Data
    func getSports(onSuccess: @escaping (Sports) -> Void, onError: @escaping (String) -> Void){
        let url = URL(string: "\(URL_BASE)all_sports.php")
        let request = URLRequest(url: url!)
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.sync {
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
            
            guard let data = data, let response = response as? HTTPURLResponse else{
                onError("Invalid Data or Response")
                return
            }

            do{
                if response.statusCode == 200{
                    let results = try JSONDecoder().decode(Sports.self, from: data)
                    onSuccess(results)
                }else{
                    let err = try JSONDecoder().decode(APIError.self, from: data)
                    onError(err.message)
                }
            } catch {
                onError(error.localizedDescription)
            }
        }
                    
    }
    task.resume()
            
    }
/*===================================================================*/
    //MARK: Get The Leagues Data
    func getLeagues(forSport sportName: String, onSuccess: @escaping (Leagues) -> Void, onError: @escaping (String) -> Void){
        let url = URL(string: "\(URL_BASE)search_all_leagues.php?c=England&s=\(sportName)")
        let request = URLRequest(url: url!)
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.sync {
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
            
            guard let data = data, let response = response as? HTTPURLResponse else{
                onError("Invalid Data or Response")
                return
            }

            do{
                if response.statusCode == 200{
                    let results = try JSONDecoder().decode(Leagues.self, from: data)
                    onSuccess(results)
                }else{
                    let err = try JSONDecoder().decode(APIError.self, from: data)
                    onError(err.message)
                }
            } catch {
                onError(error.localizedDescription)
            }
        }
                    
    }
    task.resume()
            
    }
    
/*===================================================================*/
    //MARK: Get The League Upcoming Events
    func getUpcomingEvents(forLeague leagueName: String, onSuccess: @escaping (Upcoming) -> Void, onError: @escaping (String) -> Void){
        let temp = leagueName.replacingOccurrences(of: " ", with: "%20")
        let url = URL(string: "\(URL_BASE)searchfilename.php?e=\(String(describing: temp))")
        let request = URLRequest(url: url!)
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.sync {
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
            
            guard let data = data, let response = response as? HTTPURLResponse else{
                onError("Invalid Data or Response")
                return
            }

            do{
                if response.statusCode == 200{
                    let results = try JSONDecoder().decode(Upcoming.self, from: data)
                    onSuccess(results)
                }else{
                    let err = try JSONDecoder().decode(APIError.self, from: data)
                    onError(err.message)
                }
            } catch {
                onError(error.localizedDescription)
            }
        }
                    
    }
    task.resume()
            
    }
    
/*===================================================================*/
    //MARK: Get The League Latest Events
    func getLatestEvents(forLeague leagueId: Int, onSuccess: @escaping (Latest) -> Void, onError: @escaping (String) -> Void){
        let url = URL(string: "\(URL_BASE)eventsseason.php?id=\(leagueId)&s=2021-2022")
        let request = URLRequest(url: url!)
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.sync {
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
            
            guard let data = data, let response = response as? HTTPURLResponse else{
                onError("Invalid Data or Response")
                return
            }

            do{
                if response.statusCode == 200{
                    let results = try JSONDecoder().decode(Latest.self, from: data)
                    onSuccess(results)
                }else{
                    let err = try JSONDecoder().decode(APIError.self, from: data)
                    onError(err.message)
                }
            } catch {
                onError(error.localizedDescription)
            }
        }
                    
    }
    task.resume()
            
    }
    
/*===================================================================*/
    //MARK: Get The League Teams
    func getTeams(forLeague leagueName: String, onSuccess: @escaping (Teams) -> Void, onError: @escaping (String) -> Void){
        let temp = leagueName.replacingOccurrences(of: " ", with: "%20")
        let url = URL(string: "\(URL_BASE)search_all_teams.php?l=\(String(describing: temp))")
        let request = URLRequest(url: url!)
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.sync {
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
            
            guard let data = data, let response = response as? HTTPURLResponse else{
                onError("Invalid Data or Response")
                return
            }

            do{
                if response.statusCode == 200{
                    let results = try JSONDecoder().decode(Teams.self, from: data)
                    onSuccess(results)
                }else{
                    let err = try JSONDecoder().decode(APIError.self, from: data)
                    onError(err.message)
                }
            } catch {
                onError(error.localizedDescription)
            }
        }
                    
    }
    task.resume()
            
    }
    
/*===================================================================*/
    //MARK: Check Network Connection if reachable or Unreachable
    func checkReachability() -> String {
        var temp = ""
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                temp = "Reachable via wifi"
            } else {
                temp = "Reachable via cellular"
            }

        }
        
        reachability.whenUnreachable = { _ in
            temp = "Not Reachable"
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start Notifier")
        }
        return temp
        
    }
    
/*==============================================================*/
    //MARK: Get The Sports Data
    func getCountries(onSuccess: @escaping (Country) -> Void, onError: @escaping (String) -> Void){
        let url = URL(string: "https://restcountries.com/v3.1/all")
        let request = URLRequest(url: url!)
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.sync {
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
                
                guard let data = data, let response = response as? HTTPURLResponse else{
                onError("Invalid Data or Response")
                    return
                }

                do{
                    if response.statusCode == 200{
                        let results = try JSONDecoder().decode(Country.self, from: data)
                        onSuccess(results)
                    }else{
                        let err = try JSONDecoder().decode(APIError.self, from: data)
                        onError(err.message)
                    }
                } catch {
                    onError(error.localizedDescription)
                }
            }
                        
        }
        task.resume()
                
    }
    /*===================================================================*/
}
