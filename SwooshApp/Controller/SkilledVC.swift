//
//  SkilledVC.swift
//  SwooshApp
//
//  Created by Ma7rous on 10/4/21.
//  Copyright © 2021 Ma7rous. All rights reserved.
//

import UIKit

class SkilledVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let logo = UIImage(named: "swooshLogo.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
