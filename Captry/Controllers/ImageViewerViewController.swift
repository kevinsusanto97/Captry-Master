//
//  ImageViewerViewController.swift
//  Captry
//
//  Created by Enjelina on 17/07/19.
//  Copyright © 2019 Kevin Susanto. All rights reserved.
//

import UIKit

class ImageViewerViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageView()

        
    }
    private func setupImageView(){
        guard let name = imageName else {
            return
        }
        if let image = UIImage(named: name){
            imageView.image = image
        }
    }
}
