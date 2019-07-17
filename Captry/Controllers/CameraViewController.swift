//
//  CameraViewController.swift
//  Captry
//
//  Created by Annisa Nabila Nasution on 15/07/19.
//  Copyright © 2019 Kevin Susanto. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    let captureSession = AVCaptureSession()
    
    @IBOutlet var focusRect: UIImageView!
    var previewLayer:CALayer!
    var captureDevice:AVCaptureDevice!
    @IBOutlet var flashOutlet: UIButton!
    
    let minimumZoom: CGFloat = 1.0
    let maximumZoom: CGFloat = 3.0
    var lastZoomFactor: CGFloat = 1.0
    
    var takePhoto = false
    var isGridShowen = true
    var isUsingFlash = false
    
    @IBOutlet var cameraView: UIView!
    
    @IBOutlet var gridView: UIImageView!
    
    @IBAction func takePhoto(_ sender: Any) {
        takePhoto = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //step 1 bikin gesture
        focusRect.alpha = 0
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinch(sender:)))
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(focus(sender:)))
        cameraView.addGestureRecognizer(tapGesture)
        cameraView.addGestureRecognizer(pinchGesture)
    }
    
    @objc func focus(sender:UITapGestureRecognizer){
        if (sender.state == .ended) {
            let thisFocusPoint = sender.location(in: cameraView)
            
            print("touch to focus", thisFocusPoint)
            
            let focus_x = thisFocusPoint.x / cameraView.frame.size.width
            let focus_y = thisFocusPoint.y / cameraView.frame.size.height
            
            focusRect!.center = CGPoint(x: (thisFocusPoint.x+150), y: thisFocusPoint.y)
            
            UIView.animate(withDuration: 1, animations: {
                self.focusRect.alpha = 1.0
                self.focusRect.alpha = 0.5
                self.focusRect.alpha = 1.0
                self.focusRect.alpha = 0.5
                self.focusRect.alpha = 1.0
                self.focusRect.alpha = 0.5
            }, completion: { (finished) in
                if finished{
                self.focusRect.alpha = 0.5
                }
            })
            
            if (captureDevice!.isFocusModeSupported(.autoFocus) && captureDevice!.isFocusPointOfInterestSupported) {
                do {
                    try captureDevice?.lockForConfiguration()
                    captureDevice?.focusMode = .autoFocus
                    captureDevice?.focusPointOfInterest = CGPoint(x: focus_x, y: focus_y)
                    
                    if (captureDevice!.isExposureModeSupported(.autoExpose) && captureDevice!.isExposurePointOfInterestSupported) {
                        captureDevice?.exposureMode = .autoExpose;
                        captureDevice?.exposurePointOfInterest = CGPoint(x: focus_x, y: focus_y);
                        
                        
                    }
                    
                    captureDevice?.unlockForConfiguration()
                } catch {
                    print(error)
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        prepareCamera()
    }
    
    //func pinch
    @objc func pinch(sender:UIPinchGestureRecognizer){
        guard let device = captureDevice else { return }
        
        // Return zoom value between the minimum and maximum zoom values
        func minMaxZoom(_ factor: CGFloat) -> CGFloat {
            return min(min(max(factor, minimumZoom), maximumZoom), device.activeFormat.videoMaxZoomFactor)
        }
        
        func update(scale factor: CGFloat) {
            do {
                try device.lockForConfiguration()
                defer { device.unlockForConfiguration() }
                device.videoZoomFactor = factor
            } catch {
                print("\(error.localizedDescription)")
            }
        }
        
        let newScaleFactor = minMaxZoom(sender.scale * lastZoomFactor)
        
        switch sender.state {
        case .began: fallthrough
        case .changed: update(scale: newScaleFactor)
        case .ended:
            lastZoomFactor = minMaxZoom(newScaleFactor)
            update(scale: lastZoomFactor)
        default: break
        }
    }
    
    
    func prepareCamera(){
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
        if let availabeDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back).devices as? [AVCaptureDevice] {
            captureDevice = availabeDevices.first
            beginSession()
        }
    }
    
    func beginSession(){
    if(captureDevice!.isFocusModeSupported(.continuousAutoFocus)) {
            try! captureDevice!.lockForConfiguration()
            captureDevice!.focusMode = .continuousAutoFocus
            captureDevice!.unlockForConfiguration()
        }
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(captureDeviceInput)
        }catch{
            print(error.localizedDescription)
        }
        //buat kamera
        let previewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
        previewLayer.connection?.videoOrientation = .landscapeRight
        
        self.previewLayer = previewLayer
        
        self.cameraView.layer.addSublayer(previewLayer)
        self.previewLayer.frame = self.cameraView.bounds
        
        captureSession.startRunning()
        
        //masukin gridnya
        self.view.addSubview(gridView)
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as NSString):NSNumber(value: kCVPixelFormatType_32BGRA)] as [String : Any]
        
        dataOutput.alwaysDiscardsLateVideoFrames = true
        
        captureSession.addOutput(dataOutput)
        
        captureSession.commitConfiguration()
        
        let queue = DispatchQueue(label: "com.brianadvent.captureQueue")
        dataOutput.setSampleBufferDelegate(self as! AVCaptureVideoDataOutputSampleBufferDelegate, queue: queue)
        
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        if takePhoto {
            takePhoto = false
            if let image = self.getImageFromSampleBuffer(buffer: sampleBuffer){
                let photoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PhotoResult") as! ResultViewController
                
                    photoVC.takenPhoto = image
                
                DispatchQueue.main.async {
                    
                    self.present(photoVC, animated: true, completion: {
                        self.stopCaptureSession()
                    })
                }
            }
        }
    }
    
    func getImageFromSampleBuffer(buffer:CMSampleBuffer) -> UIImage?{
        if let pixerBuffer = CMSampleBufferGetImageBuffer(buffer){
            let ciImage = CIImage(cvPixelBuffer: pixerBuffer)
            let context = CIContext()
            
            let imageRect = CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(pixerBuffer), height: CVPixelBufferGetHeight(pixerBuffer))
            
            if let image = context.createCGImage(ciImage, from: imageRect){
                return UIImage(cgImage: image, scale: UIScreen.main.scale, orientation: .right)
            }
        }
        return nil
    }
    
    func stopCaptureSession(){
        self.captureSession.stopRunning()
        
        if let inputs = captureSession.inputs as? [AVCaptureDeviceInput]{
            for input in inputs{
                self.captureSession.removeInput(input)
            }
        }
    }
    
    
    @IBAction func gridButton(_ sender: Any) {
        if isGridShowen{
            gridView.isHidden = true
            isGridShowen = false
        }else{
            gridView.isHidden = false
            isGridShowen = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .landscapeRight
    }
    
    
    @IBAction func flashButton(_ sender: Any) {
        if isUsingFlash == false {
            flashOutlet.isSelected = true
            
            UIView.animate(withDuration: 0.5, animations: {
                self.flashOutlet.setImage(UIImage(named: "flashOn"), for: .selected)
            })
            
            flashOn(device: captureDevice)
            isUsingFlash = true
        }else{
           flashOutlet.isSelected = false
            
            UIView.animate(withDuration: 0.5, animations: {
                self.flashOutlet.setImage(UIImage(named: "flashBtn"), for: .normal)
            })
            
            flashOff(device: captureDevice)
            isUsingFlash = false
        }
    }
    
    private func flashOn(device:AVCaptureDevice)
    {
        do{
            if (device.hasTorch)
            {
                try device.lockForConfiguration()
                device.torchMode = .on
                device.flashMode = .on
                device.unlockForConfiguration()
            }
        }catch{
            //DISABEL FLASH BUTTON HERE IF ERROR
            print("Device tourch Flash Error ");
        }
    }
    
    private func flashOff(device:AVCaptureDevice)
    {
        do{
            if (device.hasTorch){
                try device.lockForConfiguration()
                device.torchMode = .off
                device.flashMode = .off
                device.unlockForConfiguration()
            }
        }catch{
            //DISABEL FLASH BUTTON HERE IF ERROR
            print("Device tourch Flash Error ");
        }
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
