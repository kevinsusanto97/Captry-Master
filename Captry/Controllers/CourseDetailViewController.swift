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

    @IBOutlet var titlePopup: UILabel!
    @IBOutlet var popupView: UIView!
    @IBOutlet var dimView: UIView!
    
    
    
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
        
        popupView.layer.cornerRadius = 10
        
    }
    
    @IBAction func goToPractice(_ sender: Any) {
     performSegue(withIdentifier: "practiceSegue", sender: temp)
    }
    
    @IBAction func seeMoreAction(_ sender: UIButton) {
        performSegue(withIdentifier: "referencesIdentifier", sender: "Reference")
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
    
    
    
    //POP UP GUIDES
    func animateIn() {
        self.view.addSubview(popupView)
        popupView.center = self.view.center
        
        popupView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        popupView.alpha = 0
        
        UIView.animate(withDuration: 0.4, animations: {
            self.dimView.isHidden = false
            self.dimView.alpha = 0.85
            self.popupView.alpha = 1
            self.popupView.transform = CGAffineTransform.identity
        })
    }
    func animateOut() {
        self.view.addSubview(popupView)
        UIView.animate(withDuration: 0.5, animations: {
            self.popupView.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
            self.popupView.alpha = 0
            self.dimView.alpha = 0
        })
    }
    
    
    
    @IBAction func showGuidesBtn(_ sender: UIButton) {
        animateIn()
        
    }
    @IBAction func closePopUpBtn(_ sender: UIButton) {
        animateOut()
    }
    
    
    
    
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
}


