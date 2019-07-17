//
//  RoundedButton.swift
//  Captry
//
//  Created by Annisa Nabila Nasution on 17/07/19.
//  Copyright © 2019 Kevin Susanto. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func didMoveToWindow() {
        self.layer.cornerRadius = 5
    }

}
