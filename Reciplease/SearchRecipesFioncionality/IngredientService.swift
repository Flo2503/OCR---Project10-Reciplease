//
//  File.swift
//  Reciplease
//
//  Created by Flo on 10/01/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import Foundation

class IngredientService {
    var ingredients: [Ingredient] = []

    func add(ingredient: Ingredient) {
        ingredients.append(ingredient)
    }
    
    func removeIngredient(at index: Int) {
        ingredients.remove(at: index)
    }
    
    func removeAllIngredients() {
        ingredients.removeAll()
    }
}

