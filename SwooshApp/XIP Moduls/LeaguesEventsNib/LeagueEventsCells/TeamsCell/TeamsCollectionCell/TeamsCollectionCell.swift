//
//  TeamsCollectionCell.swift
//  SwooshApp
//
//  Created by Ma7rous on 3/5/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import UIKit
import SDWebImage

class TeamsCollectionCell: UICollectionViewCell {
/*================================================================*/
    //MARK: Outlet Connections
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var teamName: UILabel!
/*================================================================*/
    //MARK: Services Functions
    func setUpUi(forEvent team: Team) {
        teamImageView.layer.cornerRadius = teamImageView.layer.frame.width / 2 - 30
        if let str = team.strTeamBadge{
            let imgUrl = URL(string: str)
            teamImageView.sd_setImage(with: imgUrl, completed: nil)
        }else{
            teamImageView.image = UIImage(named: "swooshLogo")
        }
            
        teamName.text = team.strTeam
    }
        
}
