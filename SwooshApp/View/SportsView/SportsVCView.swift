//
//  SportsVCView.swift
//  SwooshApp
//
//  Created by Ma7rous on 2/24/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import UIKit

extension SportsViewController {

    func setCollectionView() {
        let layout = sportsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 10.0
    }
    
    
}
