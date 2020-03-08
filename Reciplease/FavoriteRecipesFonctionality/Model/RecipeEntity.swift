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

     static func addRecipeToFavorite(recipes: Recipes, viewContext: NSManagedObjectContext = AppDelegate.viewContext) {
            let favoriteRecipe = RecipeEntity(context: viewContext)
            favoriteRecipe.name = recipes.label
            favoriteRecipe.totalTime = Int64(recipes.totalTime)
            favoriteRecipe.yield = Int64(recipes.yield)
            favoriteRecipe.url = recipes.url
            favoriteRecipe.image = recipes.image
            favoriteRecipe.ingredientLines = recipes.ingredientLines.joined(separator: ",")
            
            try? viewContext.save()
    }
    
    static func selectBy(url: String, viewContext: NSManagedObjectContext = AppDelegate.viewContext) -> [Recipes] {
        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        request.predicate = NSPredicate(format: "url == %@", url)
        guard let favoriteRecipes = try? viewContext.fetch(request) else { return [] }
        var recipes = [Recipes]()
        for favorite in favoriteRecipes {
            let recipe = Recipes(label: favorite.name!, image: favorite.image!, url: favorite.url!, yield: Int(favorite.yield), ingredientLines: (favorite.ingredientLines?.split(separator: ",").map{String($0)})!, totalTime: Int(favorite.totalTime))
            recipes.append(recipe)
        }
        return recipes
    }
    
    static func existBy(url: String, viewContext: NSManagedObjectContext = AppDelegate.viewContext) -> Bool {
        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        request.predicate = NSPredicate(format: "url == %@", url)
        guard let count = try? viewContext.count(for: request) else { return false }
        
        return count > 0
    }
    
    static func deleteBy(url: String, viewContext: NSManagedObjectContext = AppDelegate.viewContext) {
        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        request.predicate = NSPredicate(format: "url == %@", url)
        if let favoriteRecipes = try? viewContext.fetch(request) {
            for recipe in favoriteRecipes {
                viewContext.delete(recipe)
            }
        }
    }
}

