//
//  LatestCollectionCell.swift
//  SwooshApp
//
//  Created by Ma7rous on 3/5/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import UIKit

class LatestCollectionCell: UICollectionViewCell {

/*================================================================*/
    //MARK: Outlet Connections
    @IBOutlet weak var latestImageView: UIImageView!
    @IBOutlet weak var latestFirstTeamName: UILabel!
    @IBOutlet weak var latestSecondTeamName: UILabel!
    @IBOutlet weak var latestMatchDate: UILabel!
    @IBOutlet weak var latestMatchTime: UILabel!
    @IBOutlet weak var firstTeamScore: UILabel!
    @IBOutlet weak var secondTeamScore: UILabel!
    @IBOutlet weak var latestMatchVenue: UILabel!
/*================================================================*/
    //MARK: Services Functions
    func setUpUi(forEvent event: Event) {
        if let imgUrl = URL(string: event.strThumb!){
            latestImageView.sd_setImage(with: imgUrl, completed: nil)
        }else{
            latestImageView.image = UIImage(named: "swooshLogo")
        }
            
        latestFirstTeamName.text = event.strHomeTeam
        latestSecondTeamName.text = event.strAwayTeam
        latestMatchDate.text = event.dateEvent
        latestMatchTime.text = event.strTime
            
        firstTeamScore.text = event.intHomeScore
        secondTeamScore.text = event.intAwayScore
    }

}
