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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courseName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.courseImageView.image = courseThumb[indexPath.row]
        cell.courseLabel.text = courseName[indexPath.row]
        
        return cell
        
        
        let titleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "titleCell", for: indexPath) as! CollectionViewCell
        
        titleCell.courseImageView.image = courseThumb[indexPath.row]
        titleCell.courseLabel.text = courseName[indexPath.row]
        
        return titleCell
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

