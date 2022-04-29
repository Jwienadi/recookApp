//
//  ListCategoryView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 25/04/22.
//

import SwiftUI
import WaterfallGrid

struct ListCategoryView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest var fetchedRecipes: FetchedResults<Recipe>
    var category: String
    
    init(category: String){
        self.category = category
        _fetchedRecipes = FetchRequest<Recipe>(entity: Recipe.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Recipe.title,  ascending: true)], predicate: NSPredicate(format: "category == %@", category))
    }
    
    var body: some View {
        
        ScrollView{
        WaterfallGrid(fetchedRecipes, id: \.self) { Recipe in
            NavigationLink(destination: DetailRecipeView(recipe: Recipe)) {
                CardRecipeView(recipe: Recipe)
                
            }
        }
//        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .gridStyle(columns: 2)
        .padding(.leading,10)
        .padding(.trailing,10)
            
        }
        .navigationTitle(category)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ListCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ListCategoryView(category: "Breakfast")
    }
}
