//
//  UpcomingCollectionCell.swift
//  SwooshApp
//
//  Created by Ma7rous on 3/5/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import UIKit
import SDWebImage

class UpcomingCollectionCell: UICollectionViewCell {

/*================================================================*/
    //MARK: Outlet Connections
    @IBOutlet weak var upcomingImageView: UIImageView!
    @IBOutlet weak var firstTeamName: UILabel!
    @IBOutlet weak var secondTeamName: UILabel!
    @IBOutlet weak var matchDate: UILabel!
    @IBOutlet weak var matchTime: UILabel!
    @IBOutlet weak var matchVenue: UILabel!
        
/*================================================================*/
    //MARK: Services Functions
    func setUpUi(forEvent event: Event) {
        let imgUrl = URL(string: event.strThumb!)
        upcomingImageView.sd_setImage(with: imgUrl!, completed: nil)
        firstTeamName.text = event.strHomeTeam
        secondTeamName.text = event.strAwayTeam
        matchDate.text = event.dateEvent
        matchTime.text = event.strTime
        matchVenue.text = event.strVenue
            
    }

}
