//
//  Recipe.swift
//  Reciplease
//
//  Created by Flo on 12/01/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import Foundation

struct Recipes: Decodable {
    let label: String
    let image: String
    let url: String
    let yield: Int
    let ingredientLines: [String]
    let totalTime: Int
}
