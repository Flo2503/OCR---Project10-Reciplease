//
//  SearchWebService.swift
//  Reciplease
//
//  Created by Flo on 11/01/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import Foundation

class SearchWebService {

    // MARK: - Properties, Instance, Init, URL endpoint
    private var recipesSession = URLSession(configuration: .default)
    private var task: URLSessionTask?
    private let apiManager = ApiManager()
    private let ingredientService = IngredientService()

    

    // Init allowing tests to access at "recipesSession" property for dependency injection.
    init(translateSession: URLSession) {
        self.recipesSession = translateSession
    }
    // Default init
    init() { }

    // MARK: - Method
    /// Network call to get recipes. In parameter : array orf string(ingredients). Callback returns Bool for success and Recipes object
    func getRecipes(for ingredients: [String], callback: @escaping (Bool, Recipes?) -> Void) {
        let request = createRequest(ingredients: ingredients)

        task?.cancel()
        task = recipesSession.dataTask(with: request, completionHandler: { (data, response, error) in
                guard let data = data, error == nil else {
                    callback(false, nil)
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(false, nil)
                    return
                }
                do {
                    let recipes = try JSONDecoder().decode(Recipes.self, from: data)
                    callback(true, recipes)
                } catch {
                    callback(false, nil)
                }
        })

        task?.resume()
    }

    /// Url GET request. In parameter : array of ingredients.
    func createRequest(ingredients: [String]) -> URLRequest {
        var components = URLComponents()
        var request = URLRequest(url: components.url!)
        let queryItemApi = URLQueryItem(name: "app_key", value: apiManager.api)
        let queryItemAppId = URLQueryItem(name: "app_id", value: apiManager.appId)
        components.scheme = "https"
        components.host = "api.edamam.com/search"
        components.queryItems = [queryItemApi, queryItemAppId]
        request.httpMethod = "GET"
        request.httpBody = "q=\(ingredients)".data(using: .utf8)
        return request

    }
    
  
}
