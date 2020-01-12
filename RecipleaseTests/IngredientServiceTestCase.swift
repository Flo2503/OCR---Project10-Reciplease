//
//  RecipleaseTests.swift
//  RecipleaseTests
//
//  Created by Flo on 08/01/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import XCTest
@testable import Reciplease

class IngredientServiceTestCase: XCTestCase {
    let ingredientService = IngredientService()
    
    func testGivenEmptyArray_WhenAddIngredientInArray_ThenArrayCountEqualOne() {
        ingredientService.add(ingredient: "cheese")
        XCTAssertEqual(ingredientService.ingredients.count, 1)
    }
    
    func testGivenArrayWithValues_WhenRemoveAll_ThenArrayIsEmpty() {
        let names = ["cheese", "bread", "oil"]
        ingredientService.ingredients = names
        ingredientService.removeAllIngredients()
        XCTAssertEqual(ingredientService.ingredients.count, 0)
    }
    
    func testGivenArrayWithValues_WhenRemoveAtIndex_ThenValueAtIndexIsRemoved() {
        let names = ["cheese", "bread", "oil"]
        ingredientService.ingredients = names
        ingredientService.removeIngredient(at: 1)
        XCTAssertEqual(ingredientService.ingredients.count, 2)
    }
    
}

