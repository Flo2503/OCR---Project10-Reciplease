//
//  Recipe.swift
//  Reciplease
//
//  Created by Flo on 12/01/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import Foundation

struct EdamamRecipes: Decodable {
    let hits: [Hit]
}

struct Hit: Decodable {
    let recipe: Recipes
}

struct Recipes: Decodable {
    let label: String
    let image: String
    let url: String
    let yield: Int
    let ingredientLines: [String]
    let totalTime: Int
}
