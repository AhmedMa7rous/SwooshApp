//
//  LeagueTableViewCell.swift
//  SwooshApp
//
//  Created by Ma7rous on 3/5/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import UIKit
import SDWebImage
import FavoriteButton

class LeagueTableViewCell: UITableViewCell {

   //MARK: Leagues Table View Cell Outlet Connections
    @IBOutlet weak var cellCustomView: UIView!
    @IBOutlet weak var leagueImageView: UIImageView!
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var favouriteBtn: UIButton!
        
    /*===============================================================*/
    func updateCellUi(forCell cell:UITableViewCell, andLeague league: League) {
        let imgUrl = URL(string: league.strBadge!)
        self.leagueImageView.sd_setImage(with: imgUrl, completed: nil)
        self.leagueName.text = league.strLeague
        self.cellCustomView.layer.borderWidth = 2.0
        self.cellCustomView.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        self.cellCustomView.layer.cornerRadius = cellCustomView.frame.size.height / 2;
        self.leagueImageView.layer.cornerRadius = leagueImageView.frame.size.height / 2;
        cell.layer.shadowOffset = CGSize(width: 0, height: 5);
        cell.layer.masksToBounds = true;
        
    }
    
}
