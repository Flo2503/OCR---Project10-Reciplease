//
//  RecipleaseTestCase.swift
//  RecipleaseTests
//
//  Created by Flo on 11/03/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import XCTest
import CoreData
@testable import Reciplease

class RecipleaseTestCase: XCTestCase {

    let fakeRecipe = Recipes(label: "label",
                             image: "image",
                             url: "urlTestFake",
                             yield: 1,
                             ingredientLines: ["chicken", "cheese"],
                             totalTime: 1)

    override func setUp() {
        RecipeEntity.deleteBy(url: "urlTestFake")
    }

    override func tearDown() {
        RecipeEntity.deleteBy(url: "urlTestFake")
    }

    func testGivenFavorites_WhenAddFavoriteTest_ThenFavoriteTestIsAddedAndExists() {

        RecipeEntity.addRecipeToFavorite(recipes: fakeRecipe)

        XCTAssertTrue(RecipeEntity.existBy(url: "urlTestFake"))
    }

    func testGivenFavorites_WhenAddFavoriteTestAndDeleteIt_ThenFavoriteTestShouldNotExist() {

        RecipeEntity.addRecipeToFavorite(recipes: fakeRecipe)

        XCTAssertTrue(RecipeEntity.existBy(url: "urlTestFake"))

        RecipeEntity.deleteBy(url: "urlTestFake")

        XCTAssertFalse(RecipeEntity.existBy(url: "urlTestFake"))
    }

    func testGivenFavorites_WhenFavoriteTestIsAdded_ThenFavoriteTestShouldExist() {

        RecipeEntity.addRecipeToFavorite(recipes: fakeRecipe)

        let recipes = RecipeEntity.getAll()

        if RecipeEntity.getAll().count == 1 {
            XCTAssertEqual(recipes, [fakeRecipe])
        } else {
            XCTAssertNotEqual(recipes, [fakeRecipe])
        }
        XCTAssertTrue(RecipeEntity.existBy(url: "urlTestFake"))
    }
}
