//
//  RecipesListViewController.swift
//  Reciplease
//
//  Created by Flo on 15/01/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import UIKit
import Alamofire

class RecipesListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getRecipes()
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let detailRecipeVC = segue.destination as! DetailRecipeViewController
            detailRecipeVC.detailRecipe = detailRecipe
        }
    }
   
    
    let segueIdentifier = "segueToDetail"
    let webService = WebService()
    var recipesList: EdamamRecipes?
    var ingredientsList: [String] = []
    var detailRecipe: [Hit] = []
    
    @IBOutlet weak var recipesTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var labelRecipeCell: UILabel!
    
    @IBOutlet weak var imageRecipeCell: UIImageView!
    
    private func getRecipes() {
        toggleIndicator(shown: true)
        webService.getData(for: ingredientsList, callback: { (success, recipes) in
            self.toggleIndicator(shown: false)
            DispatchQueue.main.async {
                guard success, let recipes = recipes else {
                    return self.errorNetworkAlert()
                }
                self.recipesList = recipes
                self.recipesTableView.reloadData()
            }
            
        })
    }
    
    private func toggleIndicator(shown: Bool) {
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = !shown
        }
    }
    
}

extension RecipesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detailRecipe = [recipesList!.hits[indexPath.row]]
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesCell", for: indexPath) as? RecipesTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(image: "", title: (recipesList?.hits[indexPath.row].recipe.label)!, subtitle: (recipesList?.hits[indexPath.row].recipe.ingredientLines.joined(separator: ", "))!, likes: (recipesList?.hits[indexPath.row].recipe.yield)!, totaTime: (recipesList?.hits[indexPath.row].recipe.totalTime)!)
        
        return cell
    }
    
    
}


