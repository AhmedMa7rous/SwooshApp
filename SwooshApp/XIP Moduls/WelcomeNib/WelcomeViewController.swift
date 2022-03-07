//
//  ViewController.swift
//  SwooshApp
//
//  Created by Ma7rous on 10/4/21.
//  Copyright © 2021 Ma7rous. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    //variables and constants
    
    
//MARK: Outlet Connections

    @IBOutlet weak var getStartedBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //set buttons view
        self.getStartedBtn.setView(sender: getStartedBtn)
    }
    
    //MARK: Action Connections
   
    @IBAction func getStartedClicked(_ sender: UIButton) {
        let vc = TabBar()
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
    }
    
    
    
}

