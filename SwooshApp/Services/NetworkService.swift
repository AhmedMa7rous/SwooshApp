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
    let URL_BASE = "https://www.thesportsdb.com/api/v1/json/2/all_sports.php"
    let session = URLSession(configuration: URLSessionConfiguration.default)
    
    /*==============================================================*/
    //MARK: Get The Data from API
    func getSports(onSuccess: @escaping (Sports) -> Void, onError: @escaping (String) -> Void){
        let url = URL(string: URL_BASE)
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
    
    /*==============================================================*/
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
    
    
}
