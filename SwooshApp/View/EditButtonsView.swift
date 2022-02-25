//
//  EditButtonsView.swift
//  SwooshApp
//
//  Created by Ma7rous on 10/4/21.
//  Copyright © 2021 Ma7rous. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setView(sender: UIButton) {
        sender.layer.borderWidth = 2.0
        sender.layer.cornerRadius = 15
        sender.layer.borderColor = UIColor.white.cgColor
    }

}
