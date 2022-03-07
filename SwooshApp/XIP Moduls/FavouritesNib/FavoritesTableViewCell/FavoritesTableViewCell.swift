//
//  FavoritesTableViewCell.swift
//  SwooshApp
//
//  Created by Ma7rous on 3/7/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import UIKit
import SDWebImage

class FavoritesTableViewCell: UITableViewCell {
/*=============================================================*/
    //MARK: Leagues Table View Cell Outlet Connections
    @IBOutlet weak var favouriteCellCustomView: UIView!
    @IBOutlet weak var favouriteImageView: UIImageView!
    @IBOutlet weak var favouriteLeagueName: UILabel!

/*===============================================================*/
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
/*===============================================================*/
    func updateCellUi(forCell cell:UITableViewCell, andLeague league: League) {
        let imgUrl = URL(string: league.strBadge!)
        self.favouriteImageView.sd_setImage(with: imgUrl, completed: nil)
        self.favouriteLeagueName.text = league.strLeague
        self.favouriteCellCustomView.layer.borderWidth = 2.0
        self.favouriteCellCustomView.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        self.favouriteCellCustomView.layer.cornerRadius = favouriteCellCustomView.frame.size.height / 2;
        self.favouriteImageView.layer.cornerRadius = favouriteImageView.frame.size.height / 2;
            cell.layer.shadowOffset = CGSize(width: 0, height: 5);
            cell.layer.masksToBounds = true;
        }
    
}
