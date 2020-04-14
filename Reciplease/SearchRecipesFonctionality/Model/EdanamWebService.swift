//
//  SearchWebService.swift
//  Reciplease
//
//  Created by Flo on 11/01/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import Foundation
import Alamofire

class EdanamWebService {

    private let appID = keysValue(named: "app_id")
    private let appKey = keysValue(named: "app_key")

/// Network call to get recipes. In parameter : Ingredients list from user. Callback returns Bool for success and Recipes object
    func getData(for ingredients: [String], callback: @escaping (Bool, [Recipes]?) -> Void) {
        let stringIngredientsRepresentation = ingredients.joined(separator: ",")
        let param = ["app_key": appKey,
                     "app_id": appID,
                     "q": stringIngredientsRepresentation]
        AF.request("https://api.edamam.com/search",
                   method: .get, parameters: param).validate().responseJSON { response in
            guard let data = response.data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let edamamRecipes = try decoder.decode(EdamamRecipes.self, from: data)
                var recipes = [Recipes]()
                for hit in edamamRecipes.hits {
                    recipes.append(hit.recipe)
                }
                callback(true, recipes)
            } catch {
                callback(false, nil)
            }
        }
    }

    /// Network call to get recipes. In parameter : image url. Callback returns UIImage.
    func getImage(url: String, callback: @escaping ((UIImage?) -> Void)) {
        AF.download(url).responseData { response in
            if let data = response.value {
                let image = UIImage(data: data)
                callback(image)
            }
        }
    }
}
