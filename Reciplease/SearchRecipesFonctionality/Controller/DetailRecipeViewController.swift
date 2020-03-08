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

    private let webService = EdanamWebService()
    private let defaultImage = "defaultImage"
    var recipe: Recipes?
    let defaultValue = " - "
    
    @IBOutlet weak var imageRecipe: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var ingredientsDetail: UITableView!
    @IBOutlet weak var getDirectionsButton: UIButton!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    @IBOutlet weak var gradientView: UIView!
    
    
    @IBAction func getDirectionsButton(_ sender: Any) {
        guard let currentUrl = recipe?.url else { return }
        guard let url = URL(string: currentUrl) else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func tapFavoriteButton(_ sender: Any) {
        saveRecipe()
    }
    
    private func saveRecipe() {
        guard let url = recipe?.url, let recipe = recipe else {
            return
        }
        if RecipeEntity.existBy(url: url) {
            RecipeEntity.deleteBy(url: url)
            favoriteButton.image = UIImage(named: "top_off")
        } else {
            RecipeEntity.addRecipeToFavorite(recipes: recipe)
            favoriteButton.image = UIImage(named: "top_on")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientsDetail.reloadData()
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getRecipeImage()
        buttonSetUp()
    }
}

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

extension DetailRecipeViewController {
     func getRecipeImage() {
        guard let urlImage = recipe?.image else {
            return
        }
        webService.getImage(url: (urlImage), callback: { (image) in
            DispatchQueue.main.async {
                guard let image = image else {
                    return self.imageRecipe.image = UIImage(named: self.defaultImage)
                }
                self.imageRecipe.image = image
            }
        })
    }
}

extension DetailRecipeViewController {
    func setUp() {
        getDirectionsButton.layer.cornerRadius = 20
        self.infoView.layer.cornerRadius = 7
        self.infoView.layer.borderWidth = 2
        self.infoView.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
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
    
    func buttonSetUp() {
        if let url = recipe?.url, RecipeEntity.existBy(url: url) {
            favoriteButton.image = UIImage(named: "top_on")
        } else {
            favoriteButton.image = UIImage(named: "top_off")
        }
    }
}














