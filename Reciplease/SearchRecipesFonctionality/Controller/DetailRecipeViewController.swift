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
    var detailRecipe: Recipes?
    
    @IBOutlet weak var imageRecipe: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var ingredientsDetail: UITableView!
    @IBOutlet weak var getDirectionsButton: UIButton!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var tapFavoriteButton: UIBarButtonItem!
    
    @IBAction func getDirectionsButton(_ sender: Any) {
        guard let currentUrl = detailRecipe?.url else { return }
        guard let url = URL(string: currentUrl) else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func favoriteButton(_ sender: Any) {
        guard let detailRecipe = detailRecipe else {
            return
        }
        RecipeEntity.addRecipeToFavorite(recipes: detailRecipe)
        self.tapFavoriteButton.image = UIImage(named: "top_on")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientsDetail.reloadData()
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getRecipeImage()
    }
    
}

extension DetailRecipeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cellsCount = detailRecipe?.ingredientLines.count else {
            return 0
        }
        return cellsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailIngredientsCell", for: indexPath)
        
        let ingredient = detailRecipe?.ingredientLines[indexPath.row]
        
        cell.textLabel?.text = "- \(String(ingredient ?? " - "))"
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}

extension DetailRecipeViewController {
     func getRecipeImage() {
        guard let urlImage = detailRecipe?.image else {
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
        recipeName.text = detailRecipe?.label
        getDirectionsButton.layer.cornerRadius = 20
        self.infoView.layer.cornerRadius = 7
        self.infoView.layer.borderWidth = 2
        self.infoView.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        if let likes = detailRecipe?.yield, let totalTime = detailRecipe?.totalTime {
            likesLabel.text = "\(String(likes))"
            totalTimeLabel.text = "\(String(totalTime))m"
        }
    }
}








