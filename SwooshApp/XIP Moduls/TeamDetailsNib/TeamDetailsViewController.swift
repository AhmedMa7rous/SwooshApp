//
//  TeamDetailsViewController.swift
//  SwooshApp
//
//  Created by Ma7rous on 3/3/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import UIKit
import SDWebImage

class TeamDetailsViewController: UIViewController {
    
    var team: Team?

    @IBOutlet weak var teamBadgeImgView: UIImageView!
    @IBOutlet weak var teamTshirtImgView: UIImageView!
    @IBOutlet weak var stadiumImgView: UIImageView!
    @IBOutlet weak var teamFoundationYear: UILabel!
    @IBOutlet weak var teamCountry: UILabel!
    @IBOutlet weak var teamDescription: UILabel!
    @IBOutlet weak var stadiumName: UILabel!
    @IBOutlet weak var teamPlayers: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.updateUI()
        self.updateViewLayout()
    }
    
    func updateUI() {
        
        let teamImgUrl = URL(string: (team?.strTeamBadge)!)
        teamBadgeImgView.sd_setImage(with: teamImgUrl, completed: nil)
       
        let tshirtImgUrl = URL(string: (team?.strTeamJersey)!)
        teamTshirtImgView.sd_setImage(with: tshirtImgUrl, completed: nil)
       
        let stadiumImgUrl = URL(string: (team?.strStadiumThumb)!)
        stadiumImgView.sd_setImage(with: stadiumImgUrl, completed: nil)
       
        teamCountry.text = team?.strStadiumLocation
        
        teamFoundationYear.text = team?.intFormedYear
        
        stadiumName.text = team?.strStadium
        teamDescription.text = team?.strDescriptionEN
    }
    
    func updateViewLayout() {
        
        stadiumImgView.layer.cornerRadius = 25
        teamTshirtImgView.layer.cornerRadius = 25
        teamBadgeImgView.layer.cornerRadius = 25
        teamDescription.layer.cornerRadius = 25
        stadiumName.layer.cornerRadius = 15
        stadiumName.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        stadiumName.layer.borderWidth = 1
        teamPlayers.layer.cornerRadius = 15
        teamPlayers.layer.borderWidth = 2
        teamPlayers.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }
    
    
    @IBAction func showTeamPlayers(_ sender: UIButton) {
        
    }
    
}
