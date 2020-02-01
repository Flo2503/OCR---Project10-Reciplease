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
        ingredientsDetail.reloadData()
        setUp()
    }
    
    var detailRecipe: [Hit] = []
    
    @IBOutlet weak var imageRecipe: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var ingredientsDetail: UITableView!
    @IBOutlet weak var getDirectionsButton: UIButton!
    
    
    @IBAction func getDirectionsButton(_ sender: Any) {
        
    }
    
    }

extension DetailRecipeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailRecipe[0].recipe.ingredientLines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailIngredientsCell", for: indexPath)
        
        let ingredient = detailRecipe[0].recipe.ingredientLines[indexPath.row]
        
        cell.textLabel?.text = "- \(ingredient)"
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
        
}

extension DetailRecipeViewController {
    func setUp() {
        recipeName.text = detailRecipe[0].recipe.label
        getDirectionsButton.layer.cornerRadius = 20
    }

}




