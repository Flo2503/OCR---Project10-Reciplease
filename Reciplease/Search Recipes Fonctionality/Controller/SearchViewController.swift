//
//  SearchViewController.swift
//  Reciplease
//
//  Created by Flo on 08/01/2020.
//  Copyright © 2020 Flo. All rights reserved.

import UIKit

class SearchViewController: UIViewController {

    // MARK: - Peoperites, instances
    private let config = ThemeConfig()
    private let searchWebService = EdamamWebService()
    private let segueIdentifier = "segueToRecipes"
    var ingredientsList: [String] = []

    // MARK: - Outlets
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var addIngredientTextField: UITextField!
    @IBOutlet weak var ingredientsTableView: UITableView!

    // MARK: - Actions
    @IBAction func addIngredient(_ sender: Any) {
        if let name = addIngredientTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines).trimmingCharacters(in: .punctuationCharacters), !name.isEmpty {
            add(ingredient: name)
            ingredientsTableView.reloadData()
            addIngredientTextField.text = ""
        }
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

    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        config.cornerRadius([addButton, clearButton, searchButton])
        config.textNavBar()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let recipesVC = segue.destination as! RecipesListViewController
            recipesVC.ingredientsList = ingredientsList
        }
    }

    private func removeIngredient(at index: Int) {
        ingredientsList.remove(at: index)
    }

    private func add(ingredient: String) {
        ingredientsList.append(ingredient)
    }
}

// MARK: - Extension  allowing to congigure table view and cells details
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
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

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            removeIngredient(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

// MARK: - Extension set up diplay
extension SearchViewController: UITextFieldDelegate {

    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addIngredientTextField.resignFirstResponder()
        if let name = addIngredientTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines).trimmingCharacters(in: .punctuationCharacters), !name.isEmpty {
            add(ingredient: name)
            ingredientsTableView.reloadData()
            addIngredientTextField.text = ""
        }
        return true
    }
}
