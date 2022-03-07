//
//  SportCell.swift
//  SwooshApp
//
//  Created by Ma7rous on 3/5/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import UIKit
import SDWebImage


class SportCell: UICollectionViewCell {
    
    @IBOutlet weak var sportImgView: UIImageView!
    @IBOutlet weak var sportNameLbl: UILabel!
    
    func updateViewFromModel(sport: Sport){
        guard let url = sport.strSportThumb, let sportName = sport.strSport else {return}
            let imgUrl = URL(string: url)
    
        sportImgView.sd_setImage(with: imgUrl, completed: nil)
        sportNameLbl.text = sportName
    }
}
