//
//  ListCategoryView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 25/04/22.
//

import SwiftUI
import WaterfallGrid

struct ListCategoryView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest var fetchedRecipes: FetchedResults<Recipe>
    var category: String
    init(category: String){
        self.category = category
        _fetchedRecipes = FetchRequest<Recipe>(entity: Recipe.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Recipe.title,  ascending: true)], predicate: NSPredicate(format: "category == %@", category))
    }
    
    var body: some View {
        
        ScrollView{
        if horizontalSizeClass == .regular && verticalSizeClass == .regular {
            WaterfallGrid(fetchedRecipes, id: \.self) { Recipe in
                NavigationLink(destination: DetailRecipeView(recipe: Recipe)) {
                    CardRecipeView(recipe: Recipe)
                    //pake geom
                    
                }
            }
            .gridStyle(columnsInPortrait: 3, columnsInLandscape: 4 ,spacing: 10, animation: .none)
            .padding(.leading,10)
            .padding(.trailing,10)
            
        } else {
            WaterfallGrid(fetchedRecipes, id: \.self) { Recipe in
                NavigationLink(destination: DetailRecipeView(recipe: Recipe)) {
                    CardRecipeView(recipe: Recipe)
                    //pake geom
                    
                }
            }
            .gridStyle(columnsInPortrait: 2, columnsInLandscape: 3 ,spacing: 10, animation: .none)
            .padding(.leading,10)
            .padding(.trailing,10)
        }
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
