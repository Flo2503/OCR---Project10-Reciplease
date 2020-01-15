//
//  RecipesServiceTestCAse.swift
//  RecipleaseTests
//
//  Created by Flo on 14/01/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import XCTest
@testable import Reciplease

class RecipesServiceTestCase: XCTestCase {
    
    func testGetRecipeShouldPostFailedCallbackIfError() {
        let recipesService = SearchWebService(recipesSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error))

        let expectation = XCTestExpectation(description: "Wait for queue change.")

        recipesService.getRecipes(for: ["chicken", "cheese"], callback: { (success, recipes) in
            XCTAssertFalse(success)
            XCTAssertNil(recipes)
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetRecipeShouldPostFailedCallbackIfNoData() {
        let recipesService = SearchWebService(recipesSession: URLSessionFake(data: nil, response: nil, error: nil))

        let expectation = XCTestExpectation(description: "Wait for queue change.")

        recipesService.getRecipes(for: ["chicken", "cheese"], callback: { (success, recipes) in
            XCTAssertFalse(success)
            XCTAssertNil(recipes)
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetRecipeShouldPostFailedCallbackIfIncorrectResponse() {
        let recipesService = SearchWebService(recipesSession: URLSessionFake(
            data: FakeResponseData.recipesCorrectData,
            response: FakeResponseData.responseKO,
            error: nil
        ))

        let expectation = XCTestExpectation(description: "Wait for queue change.")

        recipesService.getRecipes(for: ["chicken", "cheese"], callback: { (success, recipes) in
            XCTAssertFalse(success)
            XCTAssertNil(recipes)
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetRecipeShouldPostFailedCallbackIfIncorrectData() {
        let recipesService = SearchWebService(recipesSession: URLSessionFake(
            data: FakeResponseData.incorrectData,
            response: FakeResponseData.responseOK,
            error: nil
        ))

        let expectation = XCTestExpectation(description: "Wait for queue change.")

        recipesService.getRecipes(for: ["chicken", "cheese"], callback: { (success, recipes) in
            XCTAssertFalse(success)
            XCTAssertNil(recipes)
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetRecipeShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        let recipesService = SearchWebService(recipesSession: URLSessionFake(
            data: FakeResponseData.recipesCorrectData, response: FakeResponseData.responseOK, error: nil)
        )

        let expectation = XCTestExpectation(description: "Wait for queue change.")

        recipesService.getRecipes(for: ["chicken", "cheese"], callback: { (success, recipes) in
            XCTAssertTrue(success)
            XCTAssertNotNil(recipes)

            XCTAssertEqual(recipes?.label, "Salsa Chicken & Cheese Tortillas")
            XCTAssertEqual(recipes?.yield, 2)

            expectation.fulfill()
        })

        wait(for: [expectation], timeout: 0.01)
    }
}
