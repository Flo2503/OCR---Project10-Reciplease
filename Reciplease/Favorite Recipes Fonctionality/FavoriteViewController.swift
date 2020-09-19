//
//  FavoriteViewController.swift
//  Reciplease
//
//  Created by Flo on 08/02/2020.
//  Copyright © 2020 Flo. All rights reserved.

import UIKit

class FavoriteViewController: UIViewController {

    // MARK: - Proprties, instances
    private let config = ThemeConfig()
    private var favoriteRecipes: [Recipes] = []
    private let segueIdentifier = "segueFromFavToDetail"
    var detailRecipe: Recipes?

    // MARK: - Oulets
    @IBOutlet weak var favoriteTableView: UITableView!
    @IBOutlet weak var helpView: UIView!

    // MARK: - Action
    @IBAction func deleteAllFavButton(_ sender: Any) {
        RecipeEntity.deleteAll()
        favoriteRecipes = RecipeEntity.getAll()
        favoriteTableView.reloadData()
    }
    // MARK: - Methods
    override func viewWillAppear(_ animated: Bool) {
        favoriteRecipes = RecipeEntity.getAll()
        favoriteTableView.reloadData()
        emptyList()
    }

    override func viewDidLoad() {
        setupTableView()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let detailRecipeVC = segue.destination as! DetailRecipeViewController
            detailRecipeVC.recipe = detailRecipe
        }
    }

    private func emptyList() {
        if favoriteRecipes.isEmpty {
            favoriteTableView.backgroundView = helpView
        } else {
            favoriteTableView.backgroundView = nil
        }
    }

    private func setupTableView() {
        favoriteTableView.rowHeight = 200
        favoriteTableView.register(UINib(nibName: "RecipesCell", bundle: nil), forCellReuseIdentifier: "RecipesCell")
    }
}

// MARK: - Extension allowing to congigure table view and cells details
extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            RecipeEntity.deleteBy(url: favoriteRecipes[indexPath.row].url)
            favoriteRecipes = RecipeEntity.getAll()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detailRecipe = favoriteRecipes[indexPath.row]
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteRecipes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipesCell", for: indexPath) as? SetUpCells else {
            return UITableViewCell()
        }

        cell.imageForCells(url: (favoriteRecipes[indexPath.row].image))

        cell.configure(title: favoriteRecipes[indexPath.row].label,
                       subtitle: favoriteRecipes[indexPath.row].ingredientLines.joined(separator: ", "),
                       likes: favoriteRecipes[indexPath.row].yield,
                       totaTime: favoriteRecipes[indexPath.row].totalTime)

        return cell
    }
}
