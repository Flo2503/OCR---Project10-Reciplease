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
        self.cornerRadius()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let recipesVC = segue.destination as! RecipesListViewController
            recipesVC.ingredientsList = ingredientsList
        }
    }

    private let searchWebService = SearchWebService()
    private let segueIdentifier = "segueToRecipes"
    var ingredientsList: [String] = []
    
    
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var addIngredientTextField: UITextField!
    @IBOutlet weak var ingredientsTableView: UITableView!
    
    
    @IBAction func addIngredient(_ sender: Any) {
        guard let name = addIngredientTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines).trimmingCharacters(in: .punctuationCharacters), !name.isEmpty else {
            return
        }
        add(ingredient: name)
        ingredientsTableView.reloadData()
        addIngredientTextField.text = ""
    }
    
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        addIngredientTextField.resignFirstResponder()
    }
    
    @IBAction func clearList(_ sender: Any) {
        ingredientsList.removeAll()
        ingredientsTableView.reloadData()
    }
    
    @IBAction func searchRecipes(_ sender: Any) {
        if !ingredientsList.isEmpty {
            performSegue(withIdentifier: segueIdentifier, sender: self)
        } else {
            emptyListAlert()
        }
        
    }
    
    private func removeIngredient(at index: Int) {
        ingredientsList.remove(at: index)
    }
    
    private func add(ingredient: String) {
        ingredientsList.append(ingredient)
    }
    
}

extension SearchViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath)
        
        let ingredient = ingredientsList[indexPath.row]
        
        cell.textLabel?.text = "- \(ingredient)"
        
        return cell
    }
        
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            removeIngredient(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension SearchViewController {
    func cornerRadius() {
        clearButton.layer.cornerRadius = 20
        searchButton.layer.cornerRadius = 20
        addButton.layer.cornerRadius = 20
    }
}

