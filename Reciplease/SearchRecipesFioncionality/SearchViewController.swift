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

    
    private let ingredientService = IngredientService()
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var addIngredientTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func addIngredient(_ sender: Any) {
        guard let name = addIngredientTextField.text, !name.isEmpty else {
            return
        }
        let ingredient = Ingredient(name: name)
        ingredientService.add(ingredient: ingredient)
        tableView.reloadData()
        addIngredientTextField.text = ""
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        addIngredientTextField.resignFirstResponder()
    }
    
    @IBAction func clearList(_ sender: Any) {
        ingredientService.removeAllIngredients()
        tableView.reloadData()
    }
    
}

extension SearchViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientService.ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath)
        
        let ingredient = ingredientService.ingredients[indexPath.row]
        
        cell.textLabel?.text = "- \(ingredient.name)"
        
        return cell
    }
        
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ingredientService.removeIngredient(at: indexPath.row)
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

