//
//  ViewController.swift
//  SwooshApp
//
//  Created by Ma7rous on 10/4/21.
//  Copyright © 2021 Ma7rous. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {
    //variables and constants
    var state = ""
    
//MARK: Outlet Connections
    @IBOutlet weak var sportsNewsBtn: UIButton!
    @IBOutlet weak var legueChallengeBtn: UIButton!
    @IBOutlet weak var getStartedBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.intialize()
    
    }
    
    //MARK: Action Connections
    @IBAction func sportsNewsClicked(_ sender: UIButton) {
        sportsNewsBtn.backgroundColor = #colorLiteral(red: 0.09353107959, green: 0.1251952648, blue: 0.1089309826, alpha: 1)
        legueChallengeBtn.backgroundColor = #colorLiteral(red: 0.09353107959, green: 0.1251952648, blue: 0.1089309826, alpha: 0.3022260274)
        getStartedBtn.isHidden = false
        state = "toSports"
    }
    @IBAction func legueChallengeClicked(_ sender: UIButton) {
        legueChallengeBtn.backgroundColor = #colorLiteral(red: 0.09353107959, green: 0.1251952648, blue: 0.1089309826, alpha: 1)
        sportsNewsBtn.backgroundColor = #colorLiteral(red: 0.09353107959, green: 0.1251952648, blue: 0.1089309826, alpha: 0.3022260274)
        getStartedBtn.isHidden = false
        state = "toChallenge"
    }
    @IBAction func getStartedClicked(_ sender: UIButton) {
        if state == "toSports" {
            performSegue(withIdentifier: "toSportsNews", sender: self)
            
        } else if state == "toChallenge" {
            let obj = storyboard?.instantiateViewController(identifier: "legueChallenge") as! LeagueVC
            self.navigationController?.pushViewController(obj, animated: true)
        }
    }
    
    
    
}

