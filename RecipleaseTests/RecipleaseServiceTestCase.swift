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
import SwiftyJSON
@testable import Reciplease

class RecipleaseServiceTestCase: XCTestCase {
/*
    let webService = EdanamWebService()
    let ingredients = ["chicken", "apple", "chocolate"]
    
    func testToto() {
        
        let excpected = [Recipes(label: "Eat For Eight Bucks: Crunchy Chicken Salad Sandwiches with Bacon Recipe",
                                 image: "https://www.edamam.com/web-img/b18/b18aa24c520208fcbc0ddb05861c462a.jpg",
                                 url: "http://www.seriouseats.com/recipes/2011/03/eat-for-eight-bucks-crunchy-chicken-salad-sandwiches-recipe.html",
                                 yield: 2,
                                 ingredientLines: [ "1 pound boneless, skinless chicken thighs",
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
        
        let fakeJson = """
            {
            "q": "chicken,apple,chocolate",
            "from": 0,
            "to": 10,
            "more": true,
            "count": 38,
            "hits": [
              {
                "recipe": {
                  "uri": "http://www.edamam.com/ontologies/edamam.owl#recipe_de8fd70d3eca2a4b4e89eddd7cb34e37",
                  "label": "Eat For Eight Bucks: Crunchy Chicken Salad Sandwiches with Bacon Recipe",
                  "image": "https://www.edamam.com/web-img/b18/b18aa24c520208fcbc0ddb05861c462a.jpg",
                  "source": "Serious Eats",
                  "url": "http://www.seriouseats.com/recipes/2011/03/eat-for-eight-bucks-crunchy-chicken-salad-sandwiches-recipe.html",
                  "shareAs": "http://www.edamam.com/recipe/eat-for-eight-bucks-crunchy-chicken-salad-sandwiches-with-bacon-recipe-de8fd70d3eca2a4b4e89eddd7cb34e37/chicken%2Capple%2Cchocolate",
                  "yield": 2.0,
                  "dietLabels": [
                    "Low-Carb"
                  ],
                  "healthLabels": [
                    "Peanut-Free",
                    "Tree-Nut-Free",
                    "Alcohol-Free"
                  ],
                  "cautions": [
                    "Sulfites",
                    "FODMAP"
                  ],
                  "ingredientLines": [
                    "1 pound boneless, skinless chicken thighs",
                    "2 small carrots, 1 cut into rough chunks, the other diced",
                    "1 small onion, halved",
                    "2 medium celery stalks, 1 cut into rough chunks, the other diced",
                    "2 scallions, halved lengthwise and thinly sliced",
                    "2 teaspoons apple cider vinegar",
                    "Salt",
                    "3 slices bacon",
                    "4 tablespoons mayonnaise",
                    "Freshly ground pepper",
                    "4 slices bakery whole grain bread"
                  ],
                  "ingredients": [
                    {
                      "text": "1 pound boneless, skinless chicken thighs",
                      "weight": 453.59237
                    },
                    {
                      "text": "2 small carrots, 1 cut into rough chunks, the other diced",
                      "weight": 100.0
                    },
                    {
                      "text": "1 small onion, halved",
                      "weight": 70.0
                    },
                    {
                      "text": "2 medium celery stalks, 1 cut into rough chunks, the other diced",
                      "weight": 80.0
                    },
                    {
                      "text": "2 scallions, halved lengthwise and thinly sliced",
                      "weight": 30.0
                    },
                    {
                      "text": "2 teaspoons apple cider vinegar",
                      "weight": 10.0
                    },
                    {
                      "text": "Salt",
                      "weight": 6.03955422
                    },
                    {
                      "text": "3 slices bacon",
                      "weight": 87.0
                    },
                    {
                      "text": "4 tablespoons mayonnaise",
                      "weight": 58.4
                    },
                    {
                      "text": "Freshly ground pepper",
                      "weight": 3.01977711
                    },
                    {
                      "text": "4 slices bakery whole grain bread",
                      "weight": 117.6
                    }
                  ],
                  "calories": 1728.4844082461,
                  "totalWeight": 1010.680964254691,
                  "totalTime": 60.0,
                  "totalNutrients": {
                    "ENERC_KCAL": {
                      "label": "Energy",
                      "quantity": 1728.4844082461,
                      "unit": "kcal"
                    },
                    "FAT": {
                      "label": "Fat",
                      "quantity": 103.762230377786,
                      "unit": "g"
                    },
                    "FASAT": {
                      "label": "Saturated",
                      "quantity": 24.4365355962712,
                      "unit": "g"
                    },
                    "FATRN": {
                      "label": "Trans",
                      "quantity": 0.20642847400000003,
                      "unit": "g"
                    },
                    "FAMS": {
                      "label": "Monounsaturated",
                      "quantity": 34.206283931742895,
                      "unit": "g"
                    },
                    "FAPU": {
                      "label": "Polyunsaturated",
                      "quantity": 39.3054576535578,
                      "unit": "g"
                    },
                    "CHOCDF": {
                      "label": "Carbs",
                      "quantity": 74.801587461845,
                      "unit": "g"
                    },
                    "FIBTG": {
                      "label": "Fiber",
                      "quantity": 15.516403608830002,
                      "unit": "g"
                    },
                    "SUGAR": {
                      "label": "Sugars",
                      "quantity": 17.922966573504,
                      "unit": "g"
                    },
                    "PROCNT": {
                      "label": "Protein",
                      "quantity": 118.98177478372902,
                      "unit": "g"
                    },
                    "CHOLE": {
                      "label": "Cholesterol",
                      "quantity": 506.5728278000001,
                      "unit": "mg"
                    },
                    "NA": {
                      "label": "Sodium",
                      "quantity": 2347.832855861363,
                      "unit": "mg"
                    },
                    "CA": {
                      "label": "Calcium",
                      "quantity": 274.2635946120258,
                      "unit": "mg"
                    },
                    "MG": {
                      "label": "Magnesium",
                      "quantity": 245.96875212954689,
                      "unit": "mg"
                    },
                    "K": {
                      "label": "Potassium",
                      "quantity": 2300.9518785634755,
                      "unit": "mg"
                    },
                    "FE": {
                      "label": "Iron",
                      "quantity": 8.33854565095848,
                      "unit": "mg"
                    },
                    "ZN": {
                      "label": "Zinc",
                      "quantity": 10.813563610753691,
                      "unit": "mg"
                    },
                    "P": {
                      "label": "Phosphorus",
                      "quantity": 1323.7251323338,
                      "unit": "mg"
                    },
                    "VITA_RAE": {
                      "label": "Vitamin A",
                      "quantity": 909.7368057197,
                      "unit": "µg"
                    },
                    "VITC": {
                      "label": "Vitamin C",
                      "quantity": 19.317600000000002,
                      "unit": "mg"
                    },
                    "THIA": {
                      "label": "Thiamin (B1)",
                      "quantity": 1.1021466448788,
                      "unit": "mg"
                    },
                    "RIBF": {
                      "label": "Riboflavin (B2)",
                      "quantity": 1.2655026439980002,
                      "unit": "mg"
                    },
                    "NIA": {
                      "label": "Niacin (B3)",
                      "quantity": 34.970876053267304,
                      "unit": "mg"
                    },
                    "VITB6A": {
                      "label": "Vitamin B6",
                      "quantity": 2.8946971400901007,
                      "unit": "mg"
                    },
                    "FOLDFE": {
                      "label": "Folate equivalent (total)",
                      "quantity": 187.15705690869999,
                      "unit": "µg"
                    },
                    "FOLFD": {
                      "label": "Folate (food)",
                      "quantity": 187.15705690869999,
                      "unit": "µg"
                    },
                    "FOLAC": {
                      "label": "Folic acid",
                      "quantity": 0.0,
                      "unit": "µg"
                    },
                    "VITB12": {
                      "label": "Vitamin B12",
                      "quantity": 3.2019134570000003,
                      "unit": "µg"
                    },
                    "VITD": {
                      "label": "Vitamin D",
                      "quantity": 18.4559237,
                      "unit": "IU"
                    },
                    "TOCPHA": {
                      "label": "Vitamin E",
                      "quantity": 2.7120919479439998,
                      "unit": "mg"
                    },
                    "VITK1": {
                      "label": "Vitamin K",
                      "quantity": 118.76395385907,
                      "unit": "µg"
                    },
                    "WATER": {
                      "label": "Water",
                      "quantity": 691.3777462761952,
                      "unit": "g"
                    }
                  },
                  "totalDaily": {
                    "ENERC_KCAL": {
                      "label": "Energy",
                      "quantity": 86.424220412305,
                      "unit": "%"
                    },
                    "FAT": {
                      "label": "Fat",
                      "quantity": 159.63420058120923,
                      "unit": "%"
                    },
                    "FASAT": {
                      "label": "Saturated",
                      "quantity": 122.18267798135598,
                      "unit": "%"
                    },
                    "CHOCDF": {
                      "label": "Carbs",
                      "quantity": 24.93386248728167,
                      "unit": "%"
                    },
                    "FIBTG": {
                      "label": "Fiber",
                      "quantity": 62.06561443532,
                      "unit": "%"
                    },
                    "PROCNT": {
                      "label": "Protein",
                      "quantity": 237.96354956745802,
                      "unit": "%"
                    },
                    "CHOLE": {
                      "label": "Cholesterol",
                      "quantity": 168.85760926666669,
                      "unit": "%"
                    },
                    "NA": {
                      "label": "Sodium",
                      "quantity": 97.82636899422346,
                      "unit": "%"
                    },
                    "CA": {
                      "label": "Calcium",
                      "quantity": 27.426359461202583,
                      "unit": "%"
                    },
                    "MG": {
                      "label": "Magnesium",
                      "quantity": 58.56398860227307,
                      "unit": "%"
                    },
                    "K": {
                      "label": "Potassium",
                      "quantity": 48.95642294815905,
                      "unit": "%"
                    },
                    "FE": {
                      "label": "Iron",
                      "quantity": 46.325253616436,
                      "unit": "%"
                    },
                    "ZN": {
                      "label": "Zinc",
                      "quantity": 98.30512373412448,
                      "unit": "%"
                    },
                    "P": {
                      "label": "Phosphorus",
                      "quantity": 189.1035903334,
                      "unit": "%"
                    },
                    "VITA_RAE": {
                      "label": "Vitamin A",
                      "quantity": 101.0818673021889,
                      "unit": "%"
                    },
                    "VITC": {
                      "label": "Vitamin C",
                      "quantity": 21.464000000000002,
                      "unit": "%"
                    },
                    "THIA": {
                      "label": "Thiamin (B1)",
                      "quantity": 91.8455537399,
                      "unit": "%"
                    },
                    "RIBF": {
                      "label": "Riboflavin (B2)",
                      "quantity": 97.3463572306154,
                      "unit": "%"
                    },
                    "NIA": {
                      "label": "Niacin (B3)",
                      "quantity": 218.56797533292064,
                      "unit": "%"
                    },
                    "VITB6A": {
                      "label": "Vitamin B6",
                      "quantity": 222.6690107761616,
                      "unit": "%"
                    },
                    "FOLDFE": {
                      "label": "Folate equivalent (total)",
                      "quantity": 46.789264227174996,
                      "unit": "%"
                    },
                    "VITB12": {
                      "label": "Vitamin B12",
                      "quantity": 133.41306070833338,
                      "unit": "%"
                    },
                    "VITD": {
                      "label": "Vitamin D",
                      "quantity": 123.03949133333332,
                      "unit": "%"
                    },
                    "TOCPHA": {
                      "label": "Vitamin E",
                      "quantity": 18.080612986293332,
                      "unit": "%"
                    },
                    "VITK1": {
                      "label": "Vitamin K",
                      "quantity": 98.969961549225,
                      "unit": "%"
                    }
                  },
                  "digest": [
                    {
                      "label": "Fat",
                      "tag": "FAT",
                      "schemaOrgTag": "fatContent",
                      "total": 103.762230377786,
                      "hasRDI": true,
                      "daily": 159.63420058120923,
                      "unit": "g",
                      "sub": [
                        {
                          "label": "Saturated",
                          "tag": "FASAT",
                          "schemaOrgTag": "saturatedFatContent",
                          "total": 24.4365355962712,
                          "hasRDI": true,
                          "daily": 122.18267798135598,
                          "unit": "g"
                        },
                        {
                          "label": "Trans",
                          "tag": "FATRN",
                          "schemaOrgTag": "transFatContent",
                          "total": 0.20642847400000003,
                          "hasRDI": false,
                          "daily": 0.0,
                          "unit": "g"
                        },
                        {
                          "label": "Monounsaturated",
                          "tag": "FAMS",
                          "schemaOrgTag": null,
                          "total": 34.206283931742895,
                          "hasRDI": false,
                          "daily": 0.0,
                          "unit": "g"
                        },
                        {
                          "label": "Polyunsaturated",
                          "tag": "FAPU",
                          "schemaOrgTag": null,
                          "total": 39.3054576535578,
                          "hasRDI": false,
                          "daily": 0.0,
                          "unit": "g"
                        }
                      ]
                    },
                    {
                      "label": "Carbs",
                      "tag": "CHOCDF",
                      "schemaOrgTag": "carbohydrateContent",
                      "total": 74.801587461845,
                      "hasRDI": true,
                      "daily": 24.93386248728167,
                      "unit": "g",
                      "sub": [
                        {
                          "label": "Carbs (net)",
                          "tag": "CHOCDF.net",
                          "schemaOrgTag": null,
                          "total": 59.285183853015,
                          "hasRDI": false,
                          "daily": 0.0,
                          "unit": "g"
                        },
                        {
                          "label": "Fiber",
                          "tag": "FIBTG",
                          "schemaOrgTag": "fiberContent",
                          "total": 15.516403608830002,
                          "hasRDI": true,
                          "daily": 62.06561443532,
                          "unit": "g"
                        },
                        {
                          "label": "Sugars",
                          "tag": "SUGAR",
                          "schemaOrgTag": "sugarContent",
                          "total": 17.922966573504,
                          "hasRDI": false,
                          "daily": 0.0,
                          "unit": "g"
                        },
                        {
                          "label": "Sugars, added",
                          "tag": "SUGAR.added",
                          "schemaOrgTag": null,
                          "total": 0.0,
                          "hasRDI": false,
                          "daily": 0.0,
                          "unit": "g"
                        }
                      ]
                    },
                    {
                      "label": "Protein",
                      "tag": "PROCNT",
                      "schemaOrgTag": "proteinContent",
                      "total": 118.98177478372902,
                      "hasRDI": true,
                      "daily": 237.96354956745802,
                      "unit": "g"
                    },
                    {
                      "label": "Cholesterol",
                      "tag": "CHOLE",
                      "schemaOrgTag": "cholesterolContent",
                      "total": 506.5728278000001,
                      "hasRDI": true,
                      "daily": 168.85760926666669,
                      "unit": "mg"
                    },
                    {
                      "label": "Sodium",
                      "tag": "NA",
                      "schemaOrgTag": "sodiumContent",
                      "total": 2347.832855861363,
                      "hasRDI": true,
                      "daily": 97.82636899422346,
                      "unit": "mg"
                    },
                    {
                      "label": "Calcium",
                      "tag": "CA",
                      "schemaOrgTag": null,
                      "total": 274.2635946120258,
                      "hasRDI": true,
                      "daily": 27.426359461202583,
                      "unit": "mg"
                    },
                    {
                      "label": "Magnesium",
                      "tag": "MG",
                      "schemaOrgTag": null,
                      "total": 245.96875212954689,
                      "hasRDI": true,
                      "daily": 58.56398860227307,
                      "unit": "mg"
                    },
                    {
                      "label": "Potassium",
                      "tag": "K",
                      "schemaOrgTag": null,
                      "total": 2300.9518785634755,
                      "hasRDI": true,
                      "daily": 48.95642294815905,
                      "unit": "mg"
                    },
                    {
                      "label": "Iron",
                      "tag": "FE",
                      "schemaOrgTag": null,
                      "total": 8.33854565095848,
                      "hasRDI": true,
                      "daily": 46.325253616436,
                      "unit": "mg"
                    },
                    {
                      "label": "Zinc",
                      "tag": "ZN",
                      "schemaOrgTag": null,
                      "total": 10.813563610753691,
                      "hasRDI": true,
                      "daily": 98.30512373412448,
                      "unit": "mg"
                    },
                    {
                      "label": "Phosphorus",
                      "tag": "P",
                      "schemaOrgTag": null,
                      "total": 1323.7251323338,
                      "hasRDI": true,
                      "daily": 189.1035903334,
                      "unit": "mg"
                    },
                    {
                      "label": "Vitamin A",
                      "tag": "VITA_RAE",
                      "schemaOrgTag": null,
                      "total": 909.7368057197,
                      "hasRDI": true,
                      "daily": 101.0818673021889,
                      "unit": "µg"
                    },
                    {
                      "label": "Vitamin C",
                      "tag": "VITC",
                      "schemaOrgTag": null,
                      "total": 19.317600000000002,
                      "hasRDI": true,
                      "daily": 21.464000000000002,
                      "unit": "mg"
                    },
                    {
                      "label": "Thiamin (B1)",
                      "tag": "THIA",
                      "schemaOrgTag": null,
                      "total": 1.1021466448788,
                      "hasRDI": true,
                      "daily": 91.8455537399,
                      "unit": "mg"
                    },
                    {
                      "label": "Riboflavin (B2)",
                      "tag": "RIBF",
                      "schemaOrgTag": null,
                      "total": 1.2655026439980002,
                      "hasRDI": true,
                      "daily": 97.3463572306154,
                      "unit": "mg"
                    },
                    {
                      "label": "Niacin (B3)",
                      "tag": "NIA",
                      "schemaOrgTag": null,
                      "total": 34.970876053267304,
                      "hasRDI": true,
                      "daily": 218.56797533292064,
                      "unit": "mg"
                    },
                    {
                      "label": "Vitamin B6",
                      "tag": "VITB6A",
                      "schemaOrgTag": null,
                      "total": 2.8946971400901007,
                      "hasRDI": true,
                      "daily": 222.6690107761616,
                      "unit": "mg"
                    },
                    {
                      "label": "Folate equivalent (total)",
                      "tag": "FOLDFE",
                      "schemaOrgTag": null,
                      "total": 187.15705690869999,
                      "hasRDI": true,
                      "daily": 46.789264227174996,
                      "unit": "µg"
                    },
                    {
                      "label": "Folate (food)",
                      "tag": "FOLFD",
                      "schemaOrgTag": null,
                      "total": 187.15705690869999,
                      "hasRDI": false,
                      "daily": 0.0,
                      "unit": "µg"
                    },
                    {
                      "label": "Folic acid",
                      "tag": "FOLAC",
                      "schemaOrgTag": null,
                      "total": 0.0,
                      "hasRDI": false,
                      "daily": 0.0,
                      "unit": "µg"
                    },
                    {
                      "label": "Vitamin B12",
                      "tag": "VITB12",
                      "schemaOrgTag": null,
                      "total": 3.2019134570000003,
                      "hasRDI": true,
                      "daily": 133.41306070833338,
                      "unit": "µg"
                    },
                    {
                      "label": "Vitamin D",
                      "tag": "VITD",
                      "schemaOrgTag": null,
                      "total": 18.4559237,
                      "hasRDI": true,
                      "daily": 123.03949133333332,
                      "unit": "µg"
                    },
                    {
                      "label": "Vitamin E",
                      "tag": "TOCPHA",
                      "schemaOrgTag": null,
                      "total": 2.7120919479439998,
                      "hasRDI": true,
                      "daily": 18.080612986293332,
                      "unit": "mg"
                    },
                    {
                      "label": "Vitamin K",
                      "tag": "VITK1",
                      "schemaOrgTag": null,
                      "total": 118.76395385907,
                      "hasRDI": true,
                      "daily": 98.969961549225,
                      "unit": "µg"
                    },
                    {
                      "label": "Sugar alcohols",
                      "tag": "Sugar.alcohol",
                      "schemaOrgTag": null,
                      "total": 0.0,
                      "hasRDI": false,
                      "daily": 0.0,
                      "unit": "g"
                    },
                    {
                      "label": "Water",
                      "tag": "WATER",
                      "schemaOrgTag": null,
                      "total": 691.3777462761952,
                      "hasRDI": false,
                      "daily": 0.0,
                      "unit": "g"
                    }
                  ]
                },
                "bookmarked": false,
                "bought": false
              }
            """
        let expectation = XCTestExpectation(description: "wait for queue change")
        webService.getData(for: ingredients, callback: { (success, recipes) in
            
        })
    }
*/
}
