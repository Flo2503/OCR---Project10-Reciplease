//
//  File.swift
//  RecipleaseTests
//
//  Created by Flo on 14/01/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import Foundation

class FakeResponseData {
    static let responseOK = HTTPURLResponse(url: URL(string: "https://openclassrooms.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
    static let responseKO = HTTPURLResponse(url: URL(string: "https://openclassrooms.com")!, statusCode: 500, httpVersion: nil, headerFields: nil)!

    class RecipesError: Error {}
    static let error = RecipesError()

     static var recipesCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "", withExtension: "json")
        return (try? Data(contentsOf: url!)) ?? Data()
    }

    static let incorrectData = "erreur".data(using: .utf8)!
}
