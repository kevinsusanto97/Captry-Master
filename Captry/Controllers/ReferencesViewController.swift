//
//  ReferencesViewController.swift
//  Captry
//
//  Created by Enjelina on 15/07/19.
//  Copyright © 2019 Kevin Susanto. All rights reserved.
//

import UIKit

class ReferencesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let locationImage = [UIImage(named: "courseList1"),
                         UIImage(named: "courseList2"),
                         UIImage(named: "courseList3"),
                         UIImage(named: "courseList4")]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locationImage.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ReferencesCollectionViewCell
        cell.locationImage.image = locationImage[indexPath.row]
        return cell
        
    }
    

   

}
