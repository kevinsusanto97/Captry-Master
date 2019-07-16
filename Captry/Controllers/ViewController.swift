//
//  ViewController.swift
//  Captry
//
//  Created by Kevin Susanto on 12/07/19.
//  Copyright © 2019 Kevin Susanto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let courseName = ["Rule of Thirds","Symetry","Triangle Ratio", "Golden Ratio"]
    let courseThumb = [UIImage(named: "courseList1"),UIImage(named: "courseList2"),UIImage(named: "courseList3"),UIImage(named: "courseList4")]
    
    @IBOutlet var titleBox: UIView!
    
    @IBOutlet var collectionViewOutlet: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleStyle()
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courseName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.courseImageView.image = courseThumb[indexPath.row]
        cell.courseLabel.text = courseName[indexPath.row]
        
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = false
        cell.layer.shadowOpacity = 0.25
        cell.layer.shadowRadius = 20
    
        return cell
    }
    
    func titleStyle() {
        titleBox.layer.cornerRadius = 10
        titleBox.layer.shadowOpacity = 0.5
        titleBox.layer.shadowRadius = 20
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
 
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func CourseTappedAction(_ sender: Any) {
        performSegue(withIdentifier: "courseDetail", sender: nil)
    }
    
    
    
    

}

