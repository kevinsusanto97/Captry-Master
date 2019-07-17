//
//  WalkthroughContentViewController.swift
//  Captry
//
//  Created by Enjelina on 16/07/19.
//  Copyright © 2019 Kevin Susanto. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {
    // 1.MARK: - Outlets
    @IBOutlet var headingLabel: UILabel! {
        didSet {
            headingLabel.numberOfLines = 0
        }
    }
    @IBOutlet  var subHeadingLabel: UILabel!{
        didSet {
            subHeadingLabel.numberOfLines = 0
        }
    }
    @IBOutlet var contentImageView: UIImageView!
    
    // 2. MARK: - Properties
    var index = 0
    var heading = ""
    var subHeading = ""
    var imageFile = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headingLabel.text = heading
        subHeadingLabel.text = subHeading
        contentImageView.image = UIImage(named: imageFile)

    }
    
    
    

    
    // MARK: - Navigation

 

}
