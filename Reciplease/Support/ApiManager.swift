//
//  File.swift
//  Reciplease
//
//  Created by Flo on 12/01/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import Foundation
    
func keysValue(named keyname: String) -> String {
    let filePath = Bundle.main.path(forResource: "ApiKeys", ofType: "plist")
    let plist = NSDictionary(contentsOfFile: filePath!)
    let value = plist?.object(forKey: keyname) as? String ?? ""
    return value
}



