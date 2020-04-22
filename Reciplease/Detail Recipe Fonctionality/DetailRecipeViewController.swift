//
//  DetailRecipeViewController.swift
//  Reciplease
//
//  Created by Flo on 30/01/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import UIKit
import Alamofire

class DetailRecipeViewController: UIViewController {

    // MARK: - Properties, instances
    private let webService = EdamamWebService()
    private let config = ThemeConfig()
    var recipe: Recipes?
    let defaultValue = " - "

    // MARK: - Outlets
    @IBOutlet weak var imageRecipe: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var ingredientsDetail: UITableView!
    @IBOutlet weak var getDirectionsButton: UIButton!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    @IBOutlet weak var gradientView: UIView!

    // MARK: - Actions
    @IBAction func getDirectionsButton(_ sender: Any) {
        guard let currentUrl = recipe?.url else { return }
        guard let url = URL(string: currentUrl) else { return }
        UIApplication.shared.open(url)
    }

    @IBAction func tapFavoriteButton(_ sender: Any) {
        saveRecipe()
    }

    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        config.cornerRadius([getDirectionsButton])
        config.textNavBar()
        displayDetails()
        smallViewConfig()
        ingredientsDetail.reloadData()
        backButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        getRecipeImage()
        buttonSetUp()
    }

    /// Allow to save or delete recipe in favorite
    private func saveRecipe() {
        if let url = recipe?.url, let recipe = recipe {
            if RecipeEntity.existBy(url: url) {
                RecipeEntity.deleteBy(url: url)
                favoriteButton.image = UIImage(named: "top_off")
            } else {
                RecipeEntity.addRecipeToFavorite(recipes: recipe)
                favoriteButton.image = UIImage(named: "top_on")
            }
        }
    }
}

// MARK: - Extension allowing to congigure table view and cells details
extension DetailRecipeViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cellsCount = recipe?.ingredientLines.count else {
            return 0
        }
        return cellsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailIngredientsCell", for: indexPath)

        let ingredient = recipe?.ingredientLines[indexPath.row]

        cell.textLabel?.text = "- \(String(ingredient ?? " - "))"
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}

// MARK: - Extension: get recipe image
extension DetailRecipeViewController {
     private func getRecipeImage() {
        if let urlImage = recipe?.image {
            webService.getImage(url: (urlImage), callback: { (image) in
                DispatchQueue.main.async {
                    if let image = image {
                        self.imageRecipe.image = image
                    }
                }
            })
        }
    }
}

// MARK: - Extension: set up diplay
extension DetailRecipeViewController {
    private func backButton() {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
    }

    private func buttonSetUp() {
        if let url = recipe?.url, RecipeEntity.existBy(url: url) {
            favoriteButton.image = UIImage(named: "top_on")
        } else {
            favoriteButton.image = UIImage(named: "top_off")
        }
    }

    private func smallViewConfig() {
        self.infoView.layer.cornerRadius = 7
        self.infoView.layer.borderWidth = 2
        self.infoView.layer.borderColor = UIColor(red: 222/255, green: 225/255, blue: 227/255, alpha: 1).cgColor
    }

    private func displayDetails() {
        if let likes = recipe?.yield, let totalTime = recipe?.totalTime, let name = recipe?.label {
            likesLabel.text = "\(String(likes))"
            totalTimeLabel.text = "\(String(totalTime))m"
            recipeName.text = name
        } else {
            likesLabel.text = defaultValue
            totalTimeLabel.text = defaultValue
            recipeName.text = defaultValue
        }
    }
}
