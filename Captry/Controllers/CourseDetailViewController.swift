//
//  CourseDetailViewController.swift
//  Captry
//
//  Created by Fauzan Achmad on 12/07/19.
//  Copyright © 2019 Kevin Susanto. All rights reserved.
//

import UIKit
import AVKit
import YoutubePlayer_in_WKWebView

class CourseDetailViewController: UIViewController {

    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var overviewContent: UILabel!
    @IBOutlet weak var playerView: WKYTPlayerView!
    let course: [[String]] = [
        [
            "Rule of Thirds",
            "In this course you will learn about how to place some object into grids. Rule of third is a popular composition techniqu",
            "xTI09ckSqys"
        ],
        [
            "Symetry",
            "Symetry content",
            "h1nWJHK242Q"
        ]
    ]
    
    var temp: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = temp
        playerView.load(withVideoId: "xTI09ckSqys")
        overviewContent.text = ""
    }
    
}
