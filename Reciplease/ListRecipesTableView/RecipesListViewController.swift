//
//  RecipesListViewController.swift
//  Reciplease
//
//  Created by Flo on 15/01/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import UIKit

class RecipesListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getRecipes()
    }
    
    let webService = SearchWebService()
    var ingredientsList: [String] = []
    var recipesList: EdamamRecipes?
    
    @IBOutlet weak var recipesTableView: UITableView!
    
    func getRecipes() {
        webService.getData(for: ingredientsList, callback: { (success, recipes) in
            guard success, let recipes = recipes else {
                return self.errorNetworkAlert()
            }
            self.recipesList = recipes
        })
    }
    
}

extension RecipesListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let recipes = recipesList?.hits else {
            return 0
        }
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesCell", for: indexPath)
        
        cell.textLabel?.text = "Just a moment, we're looking for recipes"
        return cell
    }
    
}
