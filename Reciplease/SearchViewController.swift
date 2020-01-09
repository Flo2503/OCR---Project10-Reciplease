//
//  SearchViewController.swift
//  Reciplease
//
//  Created by Flo on 08/01/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.buttonStyle()
    }
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var addIngredientTextField: UITextField!
    
    
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        addIngredientTextField.resignFirstResponder()
    }
    
    func buttonStyle() {
        clearButton.layer.cornerRadius = 20
        searchButton.layer.cornerRadius = 20
        addButton.layer.cornerRadius = 20
    }
}


