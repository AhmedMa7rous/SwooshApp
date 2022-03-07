//
//  TabBar.swift
//  SwooshApp
//
//  Created by Ma7rous on 3/7/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {
/*===================================================================*/
    //MARK: TabBar ViewControllers
    lazy var sports : UIViewController = {
        let vc = SportsViewController()
        vc.tabBarItem.image = UIImage(systemName: "list.dash")
        vc.tabBarItem.title = "Sports"
        let navigation = UINavigationController(rootViewController: vc)
        navigation.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigation.navigationBar.barTintColor = #colorLiteral(red: 0.09353107959, green: 0.1251952648, blue: 0.1089309826, alpha: 0.850973887)
        return navigation
    }()
    
    lazy var favourites : UIViewController = {
        let vc = FavViewController()
        vc.tabBarItem.image = UIImage(systemName: "star.fill")
        vc.tabBarItem.title = "Favorites"
        let navigation = UINavigationController(rootViewController: vc)
        navigation.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigation.navigationBar.barTintColor = #colorLiteral(red: 0.09353107959, green: 0.1251952648, blue: 0.1089309826, alpha: 0.850973887)
        return navigation
    }()
    
    lazy var challenges : UIViewController = {
        let vc = ChallengesViewController()
        vc.tabBarItem.image = UIImage(systemName: "sportscourt.fill")
        vc.tabBarItem.title = "Challenges"
        let navigation = UINavigationController(rootViewController: vc)
        navigation.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigation.navigationBar.barTintColor = #colorLiteral(red: 0.09353107959, green: 0.1251952648, blue: 0.1089309826, alpha: 0.850973887)
        return navigation
    }()
/*===================================================================*/
    //MARK: View LifeCycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.setView()
        tabBar.barTintColor = #colorLiteral(red: 0.2596042752, green: 0.2611998022, blue: 0.2512036562, alpha: 1)
        tabBar.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        tabBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setViewControllers([sports, favourites, challenges], animated: true)
        
    }

/*===================================================================*/
    //MARK: Services Functions
    
}
