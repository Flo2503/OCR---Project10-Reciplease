//
//  IngredientEntity.swift
//  Reciplease
//
//  Created by Flo on 20/02/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import Foundation
import CoreData

class IngredientEntity: NSManagedObject {
    
    static func fetchAll(viewContext: NSManagedObjectContext = AppDelegate.viewContext) -> [IngredientEntity] {
        let request: NSFetchRequest<IngredientEntity> = IngredientEntity.fetchRequest()
        guard let ingredients = try? viewContext.fetch(request) else { return [] }
        return ingredients
    }
}
