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

    var detailRecipe: [Hit] = []
    private let webService = EdanamWebService()
    private let defaultImage = "defaultImage"
    
    @IBOutlet weak var imageRecipe: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var ingredientsDetail: UITableView!
    @IBOutlet weak var getDirectionsButton: UIButton!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    
   
    @IBAction func getDirectionsButton(_ sender: Any) {
        let currentRecipeUrl = detailRecipe[0].recipe.url
        guard let url = URL(string: currentRecipeUrl) else { return }
        UIApplication.shared.open(url)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientsDetail.reloadData()
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getRecipeImage()
    }
    
    @objc func tapButton() {
    }
    
}

extension DetailRecipeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailRecipe[0].recipe.ingredientLines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailIngredientsCell", for: indexPath)
        
        let ingredient = detailRecipe[0].recipe.ingredientLines[indexPath.row]
        
        cell.textLabel?.text = "- \(ingredient)"
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    
        
}

extension DetailRecipeViewController {
     func getRecipeImage() {
        webService.getImage(url: (detailRecipe[0].recipe.image), callback: { (image) in
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
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapButton))
        self.navigationItem.rightBarButtonItem = addButton
        recipeName.text = detailRecipe[0].recipe.label
        getDirectionsButton.layer.cornerRadius = 20
        self.infoView.layer.cornerRadius = 7
        self.infoView.layer.borderWidth = 2
        self.infoView.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        likesLabel.text = "\(String(detailRecipe[0].recipe.yield))" + " " + "👍🏻"
        totalTimeLabel.text = "\(String(detailRecipe[0].recipe.totalTime))m" + " " + "⏲️"
    }

}








