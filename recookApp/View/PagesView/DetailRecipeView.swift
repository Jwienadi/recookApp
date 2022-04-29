//
//  DetailRecipeView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 01/04/22.
//

import SwiftUI

struct DetailRecipeView: View {
    @Environment(\.managedObjectContext) var mangedObjectContext
    
//    var recipe: Recipe {
//        @FetchRequest(
//            entity: Recipe.entity(),
//            sortDescriptors: [NSSortDescriptor(keyPath: \Recipe.title, ascending: true )]
//        )var fetchedRecipes: FetchedResults<Recipe>
//
//        return fetchedRecipes[0]
//
//    }
    
     let recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 5){
                
                if recipe.image != nil {
                Image(uiImage: UIImage(data: recipe.image!)!)
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .padding(.bottom)
                } else {
                    Image(uiImage: UIImage(named: "default")!)
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .padding(.bottom)
                }
            
                Text(recipe.wTitle)
                .font(Font.title3.bold())
            Group{
                //change infotext to coredata fetch in vm
                HStack(alignment: .center, spacing: 15){
                    DetailInfoView(infoTitle: "Prep Time", infoText: "\(recipe.prepString)")
                Divider()
                    DetailInfoView(infoTitle: "Cook Time", infoText: "\(recipe.cookString)")
                Divider()
//                    VStack(alignment: .center){
//                        Text("Serves")
//                            .font(.footnote)
//                            .foregroundColor(.secondary)
//                        Text("10")
//                            .font(.callout)
//                            .foregroundColor(.black)
//                    }
                    DetailInfoView(infoTitle: "Serves", infoText: "\(recipe.yield) \(Image(systemName: "person.fill"))")
                Divider()
                    DetailInfoView(infoTitle: "Category", infoText: "\(recipe.wCategory)")
                }
                .padding()
                .frame(maxWidth:.infinity)
            }
        }
            VStack(alignment: .leading, spacing: 5){
                HStack(){
                Text("Source")
                    .font(Font.callout.bold())
                Text("Source Here")
                    .font(.callout)
            }
                HStack(){
                Text("Note")
                    .font(Font.callout.bold())
                Text("Source Here")
                    .font(.callout)
            }
                Text("Ingredients")
                    .font(Font.callout.bold())
                
                //list ingredients here sort by "order" call array lansgung
                ForEach(recipe.ingredientArray) { ing in
                    Text("\(ing.qty) \(ing.wUnit) \(ing.wName)")
                }
                
                Text("Steps")
                    .font(Font.callout.bold())
                
                ForEach(recipe.stepArray) { ing in
                    Text("\(ing.order).  \(ing.wStep_text)")
                }
                //list steps here
                
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .navigationTitle("Recipe")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Cook"){
                        //open pop up > mode memasak
                    }
                    Menu(content: {
                        Button(action: emptyfunc) {
                                Label("Edit Recipe", systemImage: "pencil")
                            }
                        Button(role: .destructive, action: emptyfunc) {
                                Label("Delete Recipe", systemImage: "trash")
                            }
                            }, label: {Image(systemName: "ellipsis.circle")
//                                    .font(.title3)
                                .foregroundColor(.accentColor)})
                }
            }
            
        }
    }
    func emptyfunc(){
        
    }
}


//
//struct DetailRecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailRecipeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
