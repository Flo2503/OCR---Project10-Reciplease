//
//  FavoriteViewController.swift
//  Reciplease
//
//  Created by Flo on 08/02/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    private var favoriteRecipes = RecipeEntity.fetchAll()
    private let webService = EdanamWebService()
    private let defaultImage = "defaultImage"

    @IBOutlet weak var favoriteTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        favoriteRecipes = RecipeEntity.fetchAll()
        favoriteTableView.reloadData()
    }
}

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as? FavoriteTableViewCell else {
            return UITableViewCell()
        }
        
        webService.getImage(url: (favoriteRecipes[indexPath.row].url), callback: { (image) in
            DispatchQueue.main.async {
                guard let image = image else {
                    return 
                }
                cell.configureImage(image: image)
            }
        })

        cell.configure(title: favoriteRecipes[indexPath.row].label, subtitle: favoriteRecipes[indexPath.row].ingredientLines.joined(separator: ", "), likes: favoriteRecipes[indexPath.row].yield, totaTime: favoriteRecipes[indexPath.row].totalTime)
        
        return cell
    }
}

