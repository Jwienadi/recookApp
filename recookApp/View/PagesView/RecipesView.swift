//
//  RecipesView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 10/02/22.
//

import SwiftUI
import WaterfallGrid

struct RecipesView: View {
    
    @Environment(\.managedObjectContext) var mangedObjectContext
    @FetchRequest(
        entity: Recipe.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Recipe.time_added, ascending: false )]
    )var fetchedRecipes: FetchedResults<Recipe>
    
    @State private var searchText = ""
    
    
    var body: some View {
        NavigationView{
            ScrollView{
    //        Text("Searching for \(searchText)")
    //            .searchable(text: $searchText)
    //            .navigationTitle("Searchable Example")
//            SearchBar(text: $searchText)
                WaterfallGrid(fetchedRecipes.filter({
                    searchText.isEmpty ? true : $0.wTitle.localizedStandardContains(searchText)
                }), id: \.self) { Recipe in
                NavigationLink(destination: DetailRecipeView(recipe: Recipe)) {
                    CardRecipeView(recipe: Recipe)
                    
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Recipe Title...")
            .gridStyle(columns: 2, animation: .none)
            .padding(.leading,10)
            .padding(.trailing,10)
                
            }
            .navigationTitle("Recipes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink(destination: AddRecipeViewori()){ Image(systemName: "plus")
                            .font(.title3)
                        .foregroundColor(.accentColor)
                        
                    }
                            
                }
            }
        }
        .navigationViewStyle(.stack)
//        .refreshable {
//                       print("Do your refresh work here")
//                   }
        
        
        
    }
        
    
    
    
        
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
//        let recipes = [
//            Recipe(image: "default", title: "Nasi Goreng", time: 120, yield: 5),
//            Recipe(image: "default", title: "Ayam Bakar Taliwang ala Tante Liliana", time: 150, yield: 10)
//            ]
//        RecipesView(recipes: recipes)
        RecipesView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
