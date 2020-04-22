//
//  ThemeConfig.swift
//  Reciplease
//
//  Created by Flo on 22/04/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import Foundation
import UIKit

class ThemeConfig: UIViewController {

    func cornerRadius(_ buttons: [UIButton]) {
        for element in buttons {
            element.layer.cornerRadius = 20
        }
    }

    func textNavBar() {
        self.navigationController?.navigationBar.titleTextAttributes =
        [NSAttributedString.Key.foregroundColor: UIColor.white,
         NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 21)!]
    }
}
