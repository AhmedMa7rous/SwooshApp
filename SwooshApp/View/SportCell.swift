//
//  SportCell.swift
//  SwooshApp
//
//  Created by Ma7rous on 2/24/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import UIKit
import SDWebImage
class SportCell: UICollectionViewCell {
    
    @IBOutlet weak var sportImgView: UIImageView!
    @IBOutlet weak var sportNameLbl: UILabel!
    
    func updateViewFromModel(sport: Sport){
        let imgUrl = URL(string: sport.strSportThumb!)
        sportImgView.sd_setImage(with: imgUrl, completed: nil)
        sportNameLbl.text = sport.strSport!
    }
}
