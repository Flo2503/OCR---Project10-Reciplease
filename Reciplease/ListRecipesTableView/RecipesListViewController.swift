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
    }
    
    let webService = SearchWebService()
    var ingredientsList: [String] = []
    var recipesList = [Hit]()
    
    @IBOutlet weak var recipesTableView: UITableView!
    
    func getRecipes() {
        webService.getData(for: ingredientsList, callback: { (success, recipes) in
            guard success, let recipes = recipes else {
                return self.errorNetworkAlert()
            }
            recipesList = recipes
        })
    }
    
}

extension RecipesListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
}
