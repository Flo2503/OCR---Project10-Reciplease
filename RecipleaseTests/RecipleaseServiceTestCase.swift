//
//  RecipleaseServiceTestCase.swift
//  RecipleaseTests
//
//  Created by Flo on 07/04/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import XCTest
import Alamofire
import Mockingjay
@testable import Reciplease

class RecipleaseServiceTestCase: XCTestCase {

    let webService = EdamamWebService()
    let ingredients = ["chicken", "apple", "chocolate"]
    let expected = [Recipes(label: "Eat For Eight Bucks: Crunchy Chicken Salad Sandwiches with Bacon Recipe",
                            image: "https://www.edamam.com/web-img/b18/b18aa24c520208fcbc0ddb05861c462a.jpg",
                            url: "http://www.seriouseats.com/recipes/2011/03/eat-for-eight-bucks-crunchy-chicken-salad-sandwiches-recipe.html",
                            yield: 2,
                            ingredientLines: ["1 pound boneless, skinless chicken thighs",
                            "2 small carrots, 1 cut into rough chunks, the other diced",
                            "1 small onion, halved",
                            "2 medium celery stalks, 1 cut into rough chunks, the other diced",
                            "2 scallions, halved lengthwise and thinly sliced",
                            "2 teaspoons apple cider vinegar",
                            "Salt",
                            "3 slices bacon",
                            "4 tablespoons mayonnaise",
                            "Freshly ground pepper",
                            "4 slices bakery whole grain bread"],
                            totalTime: 60)]

    func testGetConvertShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        if let path = Bundle.main.path(forResource: "FakeRecipe", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                stub(everything, json(jsonResult))
                let expectation = XCTestExpectation(description: "Alamofire")
                webService.getData(for: ingredients, callback: { (succes, recipes) in
                    XCTAssertNotNil(recipes)
                    XCTAssertTrue(succes)
                    XCTAssertEqual(self.expected, recipes)
                    expectation.fulfill()
                })
                wait(for: [expectation], timeout: 0.01)
              } catch {
                   XCTAssertTrue(false, "Could no read json from file FakeRecipe.json")
              }
        }
    }

    func testGetConvertShouldPostFailedCallbackIfError() {
        stub(everything, http(404))
        webService.getData(for: ingredients, callback: { (succes, recipes) in
            XCTAssertNil(recipes)
            XCTAssertFalse(succes)
        })
    }
}
