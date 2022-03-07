//
//  TabBarView.swift
//  SwooshApp
//
//  Created by Ma7rous on 2/24/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import UIKit

extension TabBar {

    func setView() {
        //set screen title
        let logo = UIImage(named: "swooshLogo.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
    }
}
