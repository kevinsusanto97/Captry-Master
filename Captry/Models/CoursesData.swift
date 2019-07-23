//
//  RuleOfThirdData.swift
//  Captry
//
//  Created by Muhammad Rajab Priharsanto on 16/07/19.
//  Copyright © 2019 Kevin Susanto. All rights reserved.
//

import UIKit

class CoursesData
{
    //All about Rule Of Third Data
    let ruleOfThirdOverview: String = "Dalam video ini kamu akan belajar tentang Rule of Thirds yaitu teknik komposisi yang membagi frame menjadi sembilan bagian yang sama oleh dua garis horizontal dan vertikal, kemudian menempatkan objek di sepanjang garis ini atau di titik temu garis."
    let ruleOfThirdVideo: String = "TmxpQDq3uKo"
    let ruleOfThirdImage: String = "sample-2"
    let ruleOfThirdGrid: String = "RuleOfThirdGrid"
    let ruleOfThirdReferences1: String = "sample-1"
    let ruleOfThirdReferences2: String = "sample-2"
    let ruleOfThirdReferences3: String = "sample-3"
    let ruleOfThirdReferences4: String = "sample-4"
    
    //All about Symetry Data
    let symetryOverview: String = "Dalam video ini kamu akan belajar tentang Symmetry yaitu teknik komposisi yang membagi frame menjadi dua sisi sama rata kiri-kanan atau atas-bawah kemudian menempatkan objek di sepanjang garis ini."
    let symetryVideo: String = "TmxpQDq3uKo"
    let symetryImage: String = "courseList2"
    let symetryGrid: String = "SymmetryGrid"
    let symetryReferences1: String = "sample-1"
    let symetryReferences2: String = "sample-2"
    let symetryReferences3: String = "sample-3"
    let symetryReferences4: String = "sample-4"
    
    //All about Golden Triangle Data
    let goldenTriangleOverview: String = "Dalam video ini kamu akan belajar tentang Golden Triangle yaitu teknik komposisi yang membagi frame menjadi empat segitiga dengan dua ukuran berbeda kemudian menempatkan objek di sepanjang garis ini."
    let goldenTriangleVideo: String = "TmxpQDq3uKo"
    let goldenTriangleImage: String = "courseList3"
    let goldenTriangleGrid: String = "GoldenTriangleGrid"
    let goldenTriangleReferences1: String = "sample-1"
    let goldenTriangleReferences2: String = "sample-2"
    let goldenTriangleReferences3: String = "sample-3"
    let goldenTriangleReferences4: String = "sample-4"
    
    //All about Golden Ratio Data
    let goldenRatioOverview: String = "Dalam video ini kamu akan belajar tentang Golden Ratio yaitu teknik komposisi yang membagi frame menjadi 1:1.6 atau 38/62 kemudian menempatkan objek di titik persimpangan dua garis horisontal"
    let goldenRatioVideo: String = "TmxpQDq3uKo"
    let goldenRatioImage: String = "courseList4"
    let goldenRatioGrid: String = "GoldenRatioGrid"
    let goldenRatioReferences1: String = "sample-1"
    let goldenRatioReferences2: String = "sample-2"
    let goldenRatioReferences3: String = "sample-3"
    let goldenRatioReferences4: String = "sample-4"
    
    //for lock orientation
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask)
    {
        
        if let delegate = UIApplication.shared.delegate as? AppDelegate
        {
            delegate.orientationLock = orientation
        }
    }
    
    /// OPTIONAL Added method to adjust lock and rotate to the desired orientation
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation)
    {
        
        self.lockOrientation(orientation)
        
        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
    }
}
