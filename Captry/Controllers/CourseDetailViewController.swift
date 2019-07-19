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
    @IBOutlet weak var referencesImage: UIImageView!
    @IBOutlet weak var seeMoreButton: UIButton!
    
    var temp: String?
    
    var data = CoursesData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = temp
//        overviewContent.text = ""
        changeLabel()
        changeVideo()
        addImageToImageView()
    }
    
    @IBAction func goToPractice(_ sender: Any) {
     performSegue(withIdentifier: "practiceSegue", sender: temp)
    }
    @IBAction func seeMoreAction(_ sender: UIButton) {
        performSegue(withIdentifier: "referencesIdentifier", sender: "Reference")
    }

    
//    @IBAction func seeMoreAction(_ sender: UIButton) {
//        performSegue(withIdentifier: "referencesIdentifier", sender: "Reference")
//    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let ReferenceView = segue.destination as? ReferencesViewController
//        {
//            ReferenceView.course = sender as? String
//        }
//    }
    
    func changeView()
    {
        var listImage = data.ruleOfThirdImage
        var videoLink = data.ruleOfThirdVideo
        
        if temp == "Rule of Thirds"
        {
            overviewContent.text = data.ruleOfThirdOverview
        }
        else if temp == "Symetry"
        {
            overviewContent.text = "Simetris"
            listImage = data.symetryImage
            videoLink = data.symetryVideo
            
        }
        else if temp == "Triangle Ratio"
        {
            overviewContent.text = "Segitiga"
        }
        else if temp == "Golden Ratio"
        {
            overviewContent.text = "Emas"
        }
    }
    func changeLabel()
    {
        if temp == "Rule of Thirds"
        {
            overviewContent.text = data.ruleOfThirdOverview
        }
        //overviewContent.text = "Title"
        else if temp == "Symetry"
        {
            overviewContent.text = "Simetris"
        }
        else if temp == "Triangle Ratio"
        {
            overviewContent.text = "Segitiga"
        }
        else if temp == "Golden Ratio"
        {
            overviewContent.text = "Emas"
        }
    }
    
    func addImageToImageView()
    {
        var listImage = data.ruleOfThirdImage
        if temp == "Rule of Thirds"
        {
            listImage = data.ruleOfThirdImage
        }
        else if temp == "Symetry"
        {
            listImage = data.symetryImage
        }
        else if temp == "Triangle Ratio"
        {
            listImage = data.goldenTriangleImage
        }
        else if temp == "Golden Ratio"
        {
            listImage = data.goldenRatioImage
        }
        let yourImage: UIImage = UIImage(named: listImage)!
        referencesImage.image = yourImage
    }
    
    func changeVideo()
    {
        var videoLink = data.ruleOfThirdVideo
        if temp == "Rule of Thirds"
        {
            videoLink = data.ruleOfThirdVideo
        }
        else if temp == "Symetry"
        {
            videoLink = data.symetryVideo
        }
        else if temp == "Triangle Ratio"
        {
            videoLink = data.goldenTriangleVideo
        }
        else if temp == "Golden Ratio"
        {
            videoLink = data.goldenRatioVideo
        }
        
        playerView.load(withVideoId: videoLink)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let CameraViewController = segue.destination as? CameraViewController
        {
            CameraViewController.temp = sender as? String
        }
        else if let ReferencesViewController = segue.destination as? ReferencesViewController
        {
             ReferencesViewController.course = sender as? String
        }
    }
}
