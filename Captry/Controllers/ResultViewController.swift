//
//  ResultViewController.swift
//  Captry
//
//  Created by Annisa Nabila Nasution on 15/07/19.
//  Copyright © 2019 Kevin Susanto. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var takenPhoto: UIImage?
    
    @IBOutlet var previewResult: UIImageView!
    @IBOutlet weak var previewSample: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let availableImage = takenPhoto {
            previewResult.image = UIImage(cgImage: availableImage.cgImage!, scale: availableImage.scale, orientation: .up)
        }
        
    }
    
    
    @IBAction func savePhoto(_ sender: Any) {
        guard let selectedImage = previewResult.image else {
            print("Image not found!")
            return
        }
        UIImageWriteToSavedPhotosAlbum(selectedImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        
        let alert = UIAlertController(title: "Successfully Saved", message: "Your photo was saved to camera roll", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: {
            action in
            switch action.style{
            case .default:
                self.performSegue(withIdentifier: "goToHomeFromResultSegue", sender: self)
                break
            case .cancel:
                break
            case .destructive:
                break
            @unknown default:
                break
            }
        }
        )
        )
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            print("save error")
        } else {
            print("Your image has been saved to your photos.")
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .landscapeRight
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
