//
//  CardRecipeView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 10/02/22.
//

import SwiftUI
import CoreData

struct CardRecipeView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//        
//    @FetchRequest(entity: Recipe.entity(), sortDescriptors: []) var recipe: FetchedResults<Recipe>
    
    let recipe: Recipe
   
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
//            Image("\(recipe.image ?? "default")")

            if self.recipe.image != nil {

                Image(uiImage: UIImage(data: self.recipe.image!)!)
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 90)
                .cornerRadius(5)
            } else {

                Image("default")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 90)
                    .cornerRadius(5)
            }
            Group{
                Text(recipe.wTitle)
                        .fontWeight(.medium)
                        .font(.body)
                        .lineLimit(2)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
//                        .padding(.bottom, 1)
                    HStack{
                        Group{
                        Image(systemName: "timer")
                            .foregroundColor(Color("AccentColor"))
//                            Text(String(recipe.prep_time + recipe.cook_time))
                            Text(recipe.prepcookString)
                            //prep time and other
                        }
                        Spacer()
                        Group{
                            Image(systemName: "person.fill")
                                .foregroundColor(Color("AccentColor"))
                            Text(String(recipe.yield))
                        }
                        Spacer()
                        
                    }
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 5)
            }

        }

    }
}

struct CardRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let recipes = Recipe(context: context)
//        let recipe = recipes[1]
//
////
        CardRecipeView(recipe: recipes)
            .environment(\.managedObjectContext, context)
//
//
//
//    }
//    let result = PersistenceController(inMemory: true)
//    let viewContext = result.container.viewContext
    //Test data
//    let newRecipe = Recipe(context: viewContext)
//    newRecipe.title = "Dummy Recipe"
//    newRecipe.category = "Breakfast"
//    newRecipe.cook_time = 60
//    newRecipe.prep_time = 30
//    newRecipe.yield = 2
//    newRecipe.note = "eden's favourite"
//    newRecipe.image = UIImage(named: "default")?.jpegData(compressionQuality: 1.0)
//            return CardRecipeView(recipe: newRecipe).environment(\.managedObjectContext, viewContext)
        
}
}
