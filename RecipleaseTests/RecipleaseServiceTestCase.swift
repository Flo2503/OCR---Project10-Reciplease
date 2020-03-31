//
//  RecipesServiceTestCAse.swift
//  RecipleaseTests
//
//  Created by Flo on 14/01/2020.
//  Copyright © 2020 Flo. All rights reserved.
//


import XCTest
import Alamofire
import Mockingjay
@testable import Reciplease

class RecipleaseServiceTestCase: XCTestCase {
    
    func testRefresh_FailedToFetchWeatherData_InvalidResponse() {
        let body = ["ingredient1":"chicken", "ingredient2":"onion", "ingredient3":"cheese"]
    }
}
