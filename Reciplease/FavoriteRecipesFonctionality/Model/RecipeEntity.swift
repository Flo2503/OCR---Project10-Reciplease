//
//  RecipeEntity.swift
//  Reciplease
//
//  Created by Flo on 13/02/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import Foundation
import CoreData

class RecipeEntity: NSManagedObject {
    
    static func fetchAll(viewContext: NSManagedObjectContext = AppDelegate.viewContext) -> [Recipes] {
        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        guard let favoriteRecipes = try? viewContext.fetch(request) else { return [] }
        var recipes = [Recipes]()
        for favorite in favoriteRecipes {
            let recipe = Recipes(label: favorite.name!, image: favorite.image!, url: favorite.url!, yield: Int(favorite.yield), ingredientLines: (favorite.ingredientLines?.split(separator: ",").map{String($0)})!, totalTime: Int(favorite.totalTime))
            recipes.append(recipe)
        }
        return recipes
    }
    
     func addRecipeToFavorite(recipes: Recipes, viewContext: NSManagedObjectContext = AppDelegate.viewContext) {
        let favoriteRecipe = RecipeEntity(context: viewContext)
        favoriteRecipe.name = recipes.label
        favoriteRecipe.totalTime = Int64(recipes.totalTime)
        favoriteRecipe.yield = Int64(recipes.yield)
        favoriteRecipe.url = recipes.url
        favoriteRecipe.image = recipes.image
        favoriteRecipe.ingredientLines = recipes.ingredientLines.joined(separator: ",")
        
        try? viewContext.save()
    }
    
    func delete() {}
    
}

