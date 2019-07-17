//
//  ReferencesViewController.swift
//  Captry
//
//  Created by Enjelina on 17/07/19.
//  Copyright © 2019 Kevin Susanto. All rights reserved.
//

import UIKit

class ReferencesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    // Dummy images references
    let imageReferences = [UIImage(named: "courseList1"),
                           UIImage(named: "courseList1"),
                           UIImage(named: "courseList1"),
                           UIImage(named: "courseList1")]
    
    var course: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = course
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageReferences.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ReferencesCollectionViewCell
        cell.imageReferences.image = imageReferences[indexPath.row]
        
        // Cell customize
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        
        return cell
    }
}
