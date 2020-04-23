//
//  ThemeConfig.swift
//  Reciplease
//
//  Created by Flo on 22/04/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import Foundation
import UIKit

class ThemeConfig {
    static func cornerRadius(_ buttons: [UIButton]) {
        for element in buttons {
            element.layer.cornerRadius = 20
        }
    }

    static func setUpInfoView(view: UIView) {
        view.layer.cornerRadius = 7
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 222/255, green: 225/255, blue: 227/255, alpha: 1).cgColor
    }
}
