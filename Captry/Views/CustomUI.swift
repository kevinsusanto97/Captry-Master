//
//  CustomUI.swift
//  Captry
//
//  Created by Kevin Susanto on 17/07/19.
//  Copyright © 2019 Kevin Susanto. All rights reserved.
//

import UIKit

class UISecondaryButton: UIButton {
    override func didMoveToWindow() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 0.75
        self.layer.borderColor = #colorLiteral(red: 1, green: 0.6498119235, blue: 0, alpha: 1)
        self.tintColor = #colorLiteral(red: 1, green: 0.6498119235, blue: 0, alpha: 1)
    }
}

class UIPrimaryButton: UIButton {
    override func didMoveToWindow() {
        self.layer.cornerRadius = 5
        self.layer.backgroundColor = #colorLiteral(red: 1, green: 0.6498119235, blue: 0, alpha: 1)
        self.tintColor = .white
    }
}
