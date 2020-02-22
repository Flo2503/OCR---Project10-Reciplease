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
    
    static func fetchAll(viewContext: NSManagedObjectContext = AppDelegate.viewContext) -> [RecipeEntity] {
        let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        guard let favoriteRecipes = try? viewContext.fetch(request) else { return [] }
        return favoriteRecipes
    }
    
     func addRecipeToFavorite(recipeDetail: Recipes, viewContext: NSManagedObjectContext = AppDelegate.viewContext) {
        let favoriteRecipe = RecipeEntity(context: viewContext)
        favoriteRecipe.name = recipeDetail.label
        favoriteRecipe.totalTime = String(recipeDetail.totalTime)
        favoriteRecipe.yield = String(recipeDetail.yield)
        favoriteRecipe.url = recipeDetail.url
        favoriteRecipe.image = recipeDetail.image
        
        for ingredient in recipeDetail.ingredientLines {
            let ingredientEntity = IngredientEntity(context: viewContext)
            ingredientEntity.name = ingredient
            ingredientEntity.recipe = favoriteRecipe
        }
        
        try? viewContext.save()
    }
    
    func delete() {}
    
}

