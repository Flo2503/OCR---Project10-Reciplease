//
//  AlertManager.swift
//  Reciplease
//
//  Created by Flo on 17/01/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import UIKit

extension UIViewController {

    func errorNetworkAlert() {
        let alertVC = UIAlertController(title: "Network Error", message: "An error occured, please retry.", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }

    func emptyListAlert() {
        let alertVC = UIAlertController(title: "Your list is empty", message: "Please give me some ingredients !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Got it", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }    
}
