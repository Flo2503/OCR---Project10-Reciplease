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

    func testGivenNoFavorites_WhenFavoriteTestIsAdded_ThenFavoriteRecipesEqualFakeRecipe() {

        RecipeEntity.deleteAll()

        RecipeEntity.addRecipeToFavorite(recipes: fakeRecipe)

        let recipes = RecipeEntity.getAll()

        XCTAssertEqual(recipes, [fakeRecipe])
    }

    func testGivenSomeFavorites_WhenDeleteAll_ThenFavoriteListIsEmpty() {

        RecipeEntity.addRecipeToFavorite(recipes: fakeRecipe)

        RecipeEntity.deleteAll()

        let recipes = RecipeEntity.getAll().count

        XCTAssertEqual(recipes, 0)
    }
}
