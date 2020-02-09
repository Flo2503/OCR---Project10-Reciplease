//
//  FavoriteViewController.swift
//  Reciplease
//
//  Created by Flo on 08/02/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet weak var favoriteTableView: UITableView!
    
        
    var detailRecipe: [Hit] = []
}

extension FavoriteViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailRecipe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as? FavoriteTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(image: "", title: (detailRecipe[indexPath.row].recipe.label), subtitle: (detailRecipe[indexPath.row].recipe.ingredientLines.joined(separator: ", ")), likes: (detailRecipe[indexPath.row].recipe.yield), totaTime: (detailRecipe[indexPath.row].recipe.totalTime))
        
        return cell
    }
    
    
}
