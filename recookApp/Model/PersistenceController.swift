//
//  Persistence.swift
//  recookApp
//
//  Created by Jessica Wienadi on 08/02/22.
//

import CoreData
import UIKit
import SwiftUI

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for i in 0..<5 {
            let newRecipe = Recipe(context: viewContext)
            newRecipe.title = "Dummy Recipe \(i)"
            newRecipe.category = "Breakfast"
            newRecipe.cook_time = 60
            newRecipe.prep_time = 30
            newRecipe.yield = 2
            newRecipe.note = "eden's favourite"
            newRecipe.image = UIImage(named: "default")?.jpegData(compressionQuality: 1.0)
            newRecipe.source = "google"
            newRecipe.time_added = Date()
            
            
            for i in 0..<4 {
                let recipeIngredient = Ingredient(context: viewContext)
                recipeIngredient.order = Int64(i+1)
                recipeIngredient.name = "itemname \(i)"
                recipeIngredient.unit = "kg"
                recipeIngredient.qty = 20
                recipeIngredient.header = newRecipe
                //dua2 bisa
//                newRecipe.addToIngredients(recipeIngredient)
                let recipeStep = Step(context: viewContext)
                recipeStep.order = Int64(i+1)
                recipeStep.step_text = "Lorem ipsum dolor sit amet"
                recipeStep.duration = 20
                recipeStep.header = newRecipe

            }
    
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "recookApp")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    //remove this
//    func getAllRecipe() -> [Recipe] {
//            let context = container.viewContext
//           let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
//        request.sortDescriptors = [NSSortDescriptor(keyPath: \Recipe.time_added, ascending: false )]
//           do {
//               return try context.fetch(request)
//           } catch {
//               return []
//           }
//           
//       }
    
    func save(completion: @escaping (Error?) -> () = {_ in}){
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
                completion(nil)
            } catch  {
                completion(error)
            }
        }
    }
    
    func delete(_ object: NSManagedObject, completion: @escaping (Error?) -> () = {_ in}) {
        let context = container.viewContext
        context.delete(object)
        save(completion: completion)
    }
}
