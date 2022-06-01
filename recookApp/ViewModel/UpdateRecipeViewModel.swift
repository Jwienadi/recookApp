//
//  File.swift
//  recookApp
//
//  Created by Jessica Wienadi on 31/03/22.
//

import Foundation
import CoreData
import SwiftUI

extension UpdateRecipeView {
    class UpdateRecipeViewModel: ObservableObject {
        
        
//        var categories = ["Uncategorized","Breakfast", "Rice","Noodle","Salad","Soup","Dessert","Beef","Chicken","Seafood","Vegetable","Beverage","Side Dish","Baking"]
        //to do: masukin categories lengkap
        
        //update
//        @Published var isNewData = false
//        @Published var updateItem: Recipe
        
        @Published var isShowingPhotoPicker = false
        @Published var title = ""
        @Published var selectedCategory = "No Category"
        @Published var source = ""
        @Published var prephour = ""
        @Published var prepminute = ""
        @Published var cookhour = ""
        @Published var cookminute = ""
        @Published var yield = ""
        @Published var note = ""
        @Published var image: Data = .init(count: 0)
        @Published var ingredients: [HIngredient] = [HIngredient(qty: "", unit: "", name: "", offset: 0, isSwiped: false)]
        @Published var steps: [HStep] = [HStep(step_text: "", timerOn: false, offset: 0, isSwiped: false)]
        
        init(recipe: Recipe) {
            
            
            self.title = recipe.title ?? ""
            self.selectedCategory = recipe.category ?? "Uncategorized"
            self.source = recipe.source ?? ""
            self.prephour = minutesToH(time: recipe.prep_time) ?? ""
            self.prepminute = minutesOnly(time: recipe.prep_time) ?? ""
            self.cookhour = minutesToH(time: recipe.cook_time) ?? ""
            self.cookminute = minutesOnly(time: recipe.cook_time) ?? ""
            self.yield = int64ToString(input: recipe.yield)
            self.note = recipe.note ?? ""
            self.image = recipe.image ?? .init(count: 0)
            self.ingredients = ingToHing(input: recipe.ingredientArray)
            self.steps = stepToHstep(input: recipe.stepArray)
            
            }
        
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
        func minutesToH(time: Int64) -> String?{
            let H = time / 60
            if H == 0 {
                return nil
            } else {
                return String(H)
            }
        }
        func minutesOnly(time: Int64) -> String?{
            let M = time % 60
            if M == 0 {
                return nil
            } else {
                return String(M)
            }
        }
        func int64ToString(input: Int64?) -> String{
            return "\(input?.description ?? "")"
        }
        
        func doubleToString(input: Double?) -> String{
            return "\(input?.description ?? "")"
        }
        
        func ingToHing(input: [Ingredient]) -> [HIngredient]{
            var Hingredients = [HIngredient]()
            input.forEach{ing in
                Hingredients.append(HIngredient(qty: ing.qtyString, unit: ing.unit ?? "", name: ing.name ?? "", offset: 0, isSwiped: false))
//                Hingredients.append(HIngredient(qty: doubleToString(input: ing.qty), unit: ing.unit ?? "", name: ing.name ?? "", offset: 0, isSwiped: false))
            }
            return Hingredients
        }
        func stepToHstep(input: [Step]) -> [HStep]{
            var Hstep = [HStep]()
            var timerOn = false
            input.forEach{step in
                if (step.duration != 0) {
                    timerOn = true
                }
                Hstep.append(HStep(step_text: step.step_text ?? "", hourDuration: minutesToH(time: step.duration) ?? "", minuteDuration: minutesOnly(time: step.duration) ?? "", timerOn: timerOn, offset: 0, isSwiped: false))
                timerOn = false
            }
            return Hstep
        }
        
        func timerCheck(index: Int) -> Bool{
            if steps[index].hourDuration != "" || steps[index].minuteDuration != ""   {
                return true
            } else {
                return false
            }
        }
        
        
//        func updateRecipe(context: NSManagedObjectContext, updateRecipe: Recipe){
        func updateRecipe(context: NSManagedObjectContext, updateRecipe: Recipe){
//            let updateRecipe = Recipe(context: context)
            if image.isEmpty {
                updateRecipe.image = nil
            } else {
                updateRecipe.image = image
            }
            updateRecipe.title = title
            updateRecipe.category = selectedCategory
            updateRecipe.prep_time = timeToMinutes(hour: prephour, minute: prepminute)
            updateRecipe.cook_time = timeToMinutes(hour: cookhour, minute: cookminute)
            updateRecipe.yield = intToString(value: yield)
            updateRecipe.source = source
            updateRecipe.note = note
            updateRecipe.time_added = Date()
            
            for ing in updateRecipe.ingredients ?? [] {
                context.delete(ing as! NSManagedObject)
            }
            
            for (index, ingredient) in ingredients.enumerated(){
                let recipeIngredient = Ingredient(context: context)
                recipeIngredient.order = Int64(index+1)
                recipeIngredient.name = ingredient.name
                recipeIngredient.unit = ingredient.unit
                recipeIngredient.qty = (ingredient.qty as NSString).doubleValue
                recipeIngredient.header = updateRecipe
                //dua2 bisa
//                updateRecipe.addToIngredients(recipeIngredient)
            }
//            updateRecipe.ingredients = recipeIngredient
            
            for step in updateRecipe.steps ?? [] {
                context.delete(step as! NSManagedObject)
            }

            for (index, step) in steps.enumerated(){
                let recipeStep = Step(context: context)
                recipeStep.order = Int64(index+1)
                recipeStep.step_text = step.step_text
                recipeStep.duration = Int64(timeToMinutes(hour: step.hourDuration, minute: step.minuteDuration))
                recipeStep.header = updateRecipe
                
//                updateRecipe.addToSteps(recipeStep)
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
