//
//  LeagueVC.swift
//  SwooshApp
//
//  Created by Ma7rous on 10/4/21.
//  Copyright © 2021 Ma7rous. All rights reserved.
//

import UIKit

class ChallengeVC: UIViewController {
    
    var player: Player!

    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = Player()
        nextBtn.isEnabled = false
        nextBtn.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3963743398)
        let logo = UIImage(named: "swooshLogo.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
    }
    
    @IBAction func mensBtnTapped(_ sender: Any) {
        selectLeague(leagueType: "mens")
    }
    
    @IBAction func womensBtnTapped(_ sender: Any) {
        selectLeague(leagueType: "womens")
    }
    
    @IBAction func coadBtnTapped(_ sender: Any) {
        selectLeague(leagueType: "coad")
    }
    
    @IBAction func nextBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: "onNextTapped", sender: self)
        
    }
    
    func selectLeague(leagueType: String){
        player.desiredLeague = leagueType
        nextBtn.isEnabled = true
        nextBtn.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7492572623)
    }
}
