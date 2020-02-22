//
//  FavoriteViewController.swift
//  Reciplease
//
//  Created by Flo on 08/02/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var favoriteTableView: UITableView!
    private var favoriteRecipes = RecipeEntity.fetchAll()
    private let webService = EdanamWebService()

    override func viewWillAppear(_ animated: Bool) {
        favoriteRecipes = RecipeEntity.fetchAll()
        favoriteTableView.reloadData()
    }
}

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
            favoriteRecipes[indexPath.row].delete()
               tableView.deleteRows(at: [indexPath], with: .automatic)
           }
    }
    
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
        
        webService.getImage(url: (favoriteRecipes[indexPath.row].url)!, callback: { (image) in
            DispatchQueue.main.async {
                guard let image = image else {
                    return 
                }
                cell.configureImage(image: image)
            }
        })

        cell.configure(title: favoriteRecipes[indexPath.row].name!, subtitle: favoriteRecipes[indexPath.row].name!, likes: favoriteRecipes[indexPath.row].yield!, totaTime: favoriteRecipes[indexPath.row].totalTime!)
        
        return cell
    }
}

