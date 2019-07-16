//
//  CourseDetailViewController.swift
//  Captry
//
//  Created by Fauzan Achmad on 12/07/19.
//  Copyright © 2019 Kevin Susanto. All rights reserved.
//

import UIKit

class CourseDetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let courseName = ["Rule of Thirds","Symetry","Triangle Ratio", "Golden Ratio"]
    let courseThumb = [UIImage(named: "courseList1"),UIImage(named: "courseList2"),UIImage(named: "courseList3"),UIImage(named: "courseList4")]
    
    @IBOutlet var boxTitle: UIView!
    
    func boxTitleStyle() {
        self.boxTitle.layer.cornerRadius = 10
        self.boxTitle.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.boxTitle.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        self.boxTitle.layer.shadowRadius = 20
        self.boxTitle.layer.shadowOpacity = 0.5
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        boxTitleStyle()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courseName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.courseImageView.image = courseThumb[indexPath.row]
        cell.courseLabel.text = courseName[indexPath.row]
        
        //style
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.layer.cornerRadius).cgPath
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowRadius = 20
    
        return cell
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
