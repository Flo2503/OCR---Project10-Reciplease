//
//  SearchWebService.swift
//  Reciplease
//
//  Created by Flo on 11/01/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import Foundation
import Alamofire

class WebService {

    private let apiManager = ApiManager()
    
    
    func getData(for ingredients: [String], callback: @escaping (Bool, EdamamRecipes?) -> Void) {
        let stringIngredientsRepresentation = ingredients.joined(separator: ",")
        let param = ["app_key": apiManager.api, "app_id": apiManager.appId, "q": stringIngredientsRepresentation]
        AF.request("https://api.edamam.com/search", method: .get, parameters: param).validate().responseJSON { response in
            guard let data = response.data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let recipes = try decoder.decode(EdamamRecipes.self, from: data)
                callback(true, recipes)
            } catch {
                callback(false, nil)
            }
        }
    }
}
