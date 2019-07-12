//
//  Course List Style.swift
//  Captry
//
//  Created by Kevin Susanto on 12/07/19.
//  Copyright © 2019 Kevin Susanto. All rights reserved.
//

import UIKit

class courseListStyle: UIView {
    
    override func didMoveToWindow() {
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowRadius = 20
        self.layer.shadowOpacity = 0.30
        self.layer.cornerRadius = 10
    }
}
