//
//  DetailRecipeViewController.swift
//  Reciplease
//
//  Created by Flo on 30/01/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import UIKit

class DetailRecipeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(detailRecipe[0].recipe.ingredientLines)

    }
    
    var detailRecipe: [Hit] = []
    
    
    @IBOutlet weak var imageRecipe: UIImageView!
    @IBOutlet weak var detailIngredients: UITextView!
    
     @IBAction func dismiss() {
         dismiss(animated: true, completion: nil)
     }
    
    func displayDetailIngredients() {
        let ingredients = detailRecipe[0].recipe.ingredientLines
        detailIngredients.text = ingredients.joined(separator: ",")
    }
}

