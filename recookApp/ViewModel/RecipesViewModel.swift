//
//  RecipesViewModel.swift
//  recookApp
//
//  Created by Jessica Wienadi on 15/04/22.
//

import Foundation
import CoreData

//extension RecipesView {
//    
//    class AddRecipeViewModel: ObservableObject {
//        
//        //MARK: core data
//        let container: NSPersistentContainer
//        @Published var savedRecipes: [Recipe] = []
//        
//        init(){
//            container = NSPersistentContainer(name: "recookApp")
//            container.loadPersistentStores{(description,error) in
//                if let error = error {
//                    print("ERROR LOADING CORE DATA. \(error)")
//                }
//            }
//            fetchRecipes()
//            
//        }
//        
//        func fetchRecipes(){
//            let request = NSFetchRequest<Recipe>(entityName: "Recipe")
//            do {
//                savedRecipes = try container.viewContext.fetch(request)
//            } catch let error {
//                print("ERROR FETCHING. \(error)")
//            }
//        }
//        
//    }
//}
