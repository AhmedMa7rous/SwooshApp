//
//  ExtendWelcomeVC.swift
//  SwooshApp
//
//  Created by Ma7rous on 2/24/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import UIKit

extension WelcomeVC {
    
    func intialize() {
        //set screen title
        let logo = UIImage(named: "swooshLogo.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        //set buttons view
        self.sportsNewsBtn.setView(sender: sportsNewsBtn)
        self.legueChallengeBtn.setView(sender: legueChallengeBtn)
        self.getStartedBtn.setView(sender: getStartedBtn)
        self.sportsNewsBtn.backgroundColor = #colorLiteral(red: 0.09353107959, green: 0.1251952648, blue: 0.1089309826, alpha: 0.5)
        self.legueChallengeBtn.backgroundColor = #colorLiteral(red: 0.09353107959, green: 0.1251952648, blue: 0.1089309826, alpha: 0.5)
        self.getStartedBtn.isHidden = true
        
    }
    
    
}


