//
//  File.swift
//  recookApp
//
//  Created by Jessica Wienadi on 31/03/22.
//

import Foundation
import CoreData

extension AddRecipeViewori {
    class AddRecipeViewModel: ObservableObject {
        
        
        
        var categories = ["Uncategorized","Breakfast", "Rice","Noodle","Salad","Soup","Dessert","Beef","Chicken","Seafood","Vegetable","Beverage","Side Dish","Baking"]
        //to do: masukin categories lengkap
        
        //update
//        @Published var isNewData = false
//        @Published var updateItem: Recipe
        
        @Published var isShowingPhotoPicker = false
        @Published var title = ""
        @Published var selectedCategory = "Uncategorized"
        @Published var source = ""
        @Published var prephour = ""
        @Published var prepminute = ""
        @Published var cookhour = ""
        @Published var cookminute = ""
        @Published var yield = ""
        @Published var note = ""
        @Published var image: Data = .init(count: 0)
        @Published var ingredients: [HIngredient] = [HIngredient]()
        @Published var steps: [HStep] = [HStep]()
        
//        @Published var ingredientRowCount = 1
        
//        func addIngredientRow() {
//            ingredientRowCount += 1
//        }
        
        func timeToMinutes(hour: String, minute: String) -> Int64 {
            let hourInt = intToString(value: hour)
            let minuteInt = intToString(value: minute)
            let res = (hourInt * 60) + minuteInt
            return res
        }
        
        func intToString(value: String) -> Int64 {
            let result = (value == "") ? 0 : Int64(value) ?? 0
            return result
        }
        
        
        func addRecipe(context: NSManagedObjectContext){
            let newRecipe = Recipe(context: context)
            if image.isEmpty {
                newRecipe.image = nil
            } else {
                newRecipe.image = image
            }
            newRecipe.title = title
            newRecipe.category = selectedCategory
            newRecipe.prep_time = timeToMinutes(hour: prephour, minute: prepminute)
            newRecipe.cook_time = timeToMinutes(hour: cookhour, minute: cookminute)
            newRecipe.yield = intToString(value: yield)
            newRecipe.source = source
            newRecipe.note = note
            newRecipe.time_added = Date()
            
            for (index, ingredient) in ingredients.enumerated(){
                let recipeIngredient = Ingredient(context: context)
                recipeIngredient.order = Int64(index+1)
                recipeIngredient.name = ingredient.name
                recipeIngredient.unit = ingredient.unit
                recipeIngredient.qty = (ingredient.qty as NSString).doubleValue
                recipeIngredient.header = newRecipe
                //dua2 bisa
//                newRecipe.addToIngredients(recipeIngredient)
            }

            for (index, step) in steps.enumerated(){
                let recipeStep = Step(context: context)
                recipeStep.order = Int64(index+1)
                recipeStep.step_text = step.step_text
                if step.timerOn{
                    recipeStep.duration = Int64(timeToMinutes(hour: step.hourDuration, minute: step.minuteDuration))
                } else {
                    recipeStep.duration = 0
                }
                recipeStep.header = newRecipe
                
//                newRecipe.addToSteps(recipeStep)
            }
//            save(context: context)
            PersistenceController.shared.save()
            
        }
        
//        func save(context: NSManagedObjectContext){
//            do {
//                try context.save()
//                print("SAVE BISA")
//            } catch let error {
//                print("saving error. .\(error)")
//            }
//        }
        
    }
}
