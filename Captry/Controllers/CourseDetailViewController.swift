//
//  CourseDetailViewController.swift
//  Captry
//
//  Created by Fauzan Achmad on 12/07/19.
//  Copyright © 2019 Kevin Susanto. All rights reserved.
//

import UIKit
import AVKit

class CourseDetailViewController: UIViewController {

    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var overviewContent: UILabel!
    @IBOutlet weak var tutorialVideoThumb: UIImageView!
    @IBOutlet weak var containerTutorVideo: UIView!
    
    let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return courseName.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
//        
//        DispatchQueue.global().async {
//            let asset = AVAsset(url: self.videoURL!)
//            let assetImgGenerate : AVAssetImageGenerator = AVAssetImageGenerator(asset: asset)
//            assetImgGenerate.appliesPreferredTrackTransform = true
//            let time = CMTimeMake(value: 1, timescale: 2)
//            let img = try? assetImgGenerate.copyCGImage(at: time, actualTime: nil)
//            if img != nil {
//                let frameImg  = UIImage(cgImage: img!)
//                DispatchQueue.main.async(execute: {
//                    // assign your image to UIImageView
//                    self.tutorialVideoThumb.image = frameImg
//                })
//            }
//        }
//    }

    @IBAction func playTutorialVideo(_ sender: Any) {
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func CourseTappedAction(_ sender: Any) {
        performSegue(withIdentifier: "courseDetail", sender: nil)
    }
    */
    
    
    
    
}
