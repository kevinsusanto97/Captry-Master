//
//  ReferencesViewController.swift
//  Captry
//
//  Created by Enjelina on 15/07/19.
//  Copyright © 2019 Kevin Susanto. All rights reserved.
//

import UIKit

class ReferencesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    // Dummy images references
    let imageReferences = [UIImage(named: "RuleOfThirds1"),
                         UIImage(named: "RuleOfThirds2"),
                         UIImage(named: "RuleOfThirds3"),
                         UIImage(named: "RuleOfThirds4")]
    
    // For imageViewer(1)
    let viewImageSegueidentifier = "viewImageSegueidentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageReferences.count
    }
     // For imageViewer(3)
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let item = sender as! UIImage
//        if segue.identifier == viewImageSegueidentifier{
//            if let vc = segue.destination as? ImageViewerViewController{
//                vc.imageName = item
//            }
//        }
//    }
    
    
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
//    // For imageViewer(2)
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let item = imageReferences(indexPath.item)
//        performSegue(withIdentifier: viewImageSegueidentifier, sender: item)
//    }
}
