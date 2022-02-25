//
//  SportsVC.swift
//  SwooshApp
//
//  Created by Ma7rous on 2/24/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import UIKit

class SportsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//MARK: Constants & Variables
    var state = ""
    var sportsArray:[Sport]?
    
/*=========================================================================*/
//MARK: Outlet Connections
    @IBOutlet weak var sportsCollectionView: UICollectionView!
    
/*=========================================================================*/
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sportsCollectionView.delegate = self
        sportsCollectionView.dataSource = self
        sportsArray = [Sport]()
        self.intialization()
        sportsCollectionView.reloadData()
    }
    
/*=========================================================================*/
//MARK: CollectionView Functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (sportsArray?.count) ?? 0;
       }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sportCell", for: indexPath) as? SportCell{
        let sport = sportsArray![indexPath.row]
        cell.updateViewFromModel(sport: sport)
        return cell
        }
             
        return SportCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsScreen") as! DetailsViewController
//        let movie = moviesArray![indexPath.row]
//        vc.mov = movie
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  25
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: 200)
    }
    
/*=========================================================================*/
    //MARK: Services Functions
    func intialization(){
        state = NetworkService.shared.checkReachability()
        
            NetworkService.shared.getSports(onSuccess: { (sports) in
                self.sportsArray = sports.sports
                self.sportsCollectionView.reloadData()
            }) { (errorMessage) in
                debugPrint(errorMessage)
            }
           
        
    }
}
