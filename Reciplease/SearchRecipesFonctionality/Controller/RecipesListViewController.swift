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

    private let segueIdentifier = "segueToDetail"
    private let defaultImage = "defaultImage"
    private let webService = EdanamWebService()
    var recipes: [Recipes] = []
    var recipe: Recipes?
    var ingredientsList: [String] = []
    
    
    @IBOutlet weak var recipesTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRecipes()
     }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == segueIdentifier {
             let detailRecipeVC = segue.destination as! DetailRecipeViewController
             detailRecipeVC.recipe = recipe
         }
     }
    
    private func getRecipes() {
        toggleIndicator(shown: true)
        webService.getData(for: ingredientsList, callback: { (success, recipes) in
            self.toggleIndicator(shown: false)
            DispatchQueue.main.async {
                guard success, let recipes = recipes else {
                    return self.errorNetworkAlert()
                }
                self.recipes = recipes
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
        recipe = recipes[indexPath.row]
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
    }
}

extension RecipesListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesCell", for: indexPath) as? RecipesTableViewCell else {
            return UITableViewCell()
        }
        
        webService.getImage(url: (recipes[indexPath.row].image), callback: { (image) in
            DispatchQueue.main.async {
                guard let image = image else {
                    return cell.configureImage(image: UIImage(named: self.defaultImage)!)
                }
                cell.configureImage(image: image)
            }
        })
        
        cell.configure(title: (recipes[indexPath.row].label), subtitle: (recipes[indexPath.row].ingredientLines.joined(separator: ", ")), likes: (recipes[indexPath.row].yield), totaTime: (recipes[indexPath.row].totalTime))
        
        return cell
    }
}




