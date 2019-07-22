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
    var imageReferences = [UIImage(named: "courseList1"),
                           UIImage(named: "courseList1"),
                           UIImage(named: "courseList1"),
                           UIImage(named: "courseList1")]
    
    var course: String?
    
    var referencesData = CoursesData()
    
    var selectedReferences: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "References"
        changeReferencesView()
        //print(course)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageReferences.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ReferencesCollectionViewCell
        cell.imageReferences.image = imageReferences[indexPath.row]
        
        // Cell customize
//        cell.contentView.layer.cornerRadius = 4.0
//        cell.contentView.layer.borderWidth = 1.0
//        cell.contentView.layer.borderColor = UIColor.clear.cgColor
//        cell.contentView.layer.masksToBounds = false
//
//        cell.layer.shadowColor = UIColor.gray.cgColor
//        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 0.25
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    func changeReferencesView()
    {
        if course == "Rule of Thirds"
        {
            imageReferences[0] = UIImage(named: referencesData.ruleOfThirdReferences1)
            imageReferences[1] = UIImage(named: referencesData.ruleOfThirdReferences2)
            imageReferences[2] = UIImage(named: referencesData.ruleOfThirdReferences3)
            imageReferences[3] = UIImage(named: referencesData.ruleOfThirdReferences4)
        }
        else if course == "Symetry"
        {
            imageReferences = [UIImage(named: referencesData.symetryReferences1),
                               UIImage(named: referencesData.symetryReferences2),
                               UIImage(named: referencesData.symetryReferences3),
                               UIImage(named: referencesData.symetryReferences4)]
        }
        else if course == "Triangle Ratio"
        {
            imageReferences[0] = UIImage(named: referencesData.goldenTriangleReferences1)
            imageReferences[1] = UIImage(named: referencesData.goldenTriangleReferences2)
            imageReferences[2] = UIImage(named: referencesData.goldenTriangleReferences3)
            imageReferences[3] = UIImage(named: referencesData.goldenTriangleReferences4)
        }
        else if course == "Golden Ratio"
        {
            imageReferences[0] = UIImage(named: referencesData.goldenRatioReferences1)
            imageReferences[1] = UIImage(named: referencesData.goldenRatioReferences2)
            imageReferences[2] = UIImage(named: referencesData.goldenRatioReferences3)
            imageReferences[3] = UIImage(named: referencesData.goldenRatioReferences4)
        }
    }
}
