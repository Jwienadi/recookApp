//
//  RecipesView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 10/02/22.
//

import SwiftUI
import WaterfallGrid

struct RecipesView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    @Environment(\.managedObjectContext) var mangedObjectContext
//    
//    var columnPor: Int = 0
//    var columnLand: Int = 0
    
//    func initcolumn(){
//        if horizontalSizeClass == .regular && verticalSizeClass == .regular {
//            self.columnPor = 3
//            self.columnLand = 4
//            print("ipad")
//        } else {
//            self.columnPor = 2
//            self.columnLand = 3
//            print(horizontalSizeClass)
//            print(verticalSizeClass)
//            print("iphone")
//        }
//    }
    
    
    @FetchRequest(
        entity: Recipe.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Recipe.time_added, ascending: false )]
    )var fetchedRecipes: FetchedResults<Recipe>
    
//    var viewModel = RecipeViewModel()
    
    @State private var searchText = ""
    @State private var isPresentingAddRecipeView = false
//    @State private var showingSuccessAlert = false
    
    
    var body: some View {
        NavigationView{
            GeometryReader{ bounds in
                ScrollView{
                    if fetchedRecipes.isEmpty{
                        VStack(alignment: .center){
                            Group{
                            Spacer()
                            Text("Start adding your recipe!")
                                .font(.callout)
                            LottieView(name: "cooking", loopMode: .loop)
    //                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 300, alignment: .center)
                                    .frame(width: bounds.size.width, height: bounds.size.height/2, alignment: .center)
                            Spacer()
                            }
                        }
                                   
                    } else {
        if horizontalSizeClass == .regular && verticalSizeClass == .regular {
                    //content start
                    WaterfallGrid(fetchedRecipes.filter({
    //                WaterfallGrid(viewModel.recipes.filter({
                        searchText.isEmpty ? true : $0.wTitle.localizedStandardContains(searchText)
                    }), id: \.self) { Recipe in
                    NavigationLink(destination: DetailRecipeView(recipe: Recipe)) {
                        CardRecipeView(recipe: Recipe)
//                            .frame(width: (bounds.size.width/2)-20)
                        
                    }
                }
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Recipe Title...")
                .gridStyle(columnsInPortrait: 3, columnsInLandscape: 4 ,spacing: 10, animation: .none)
//                .gridStyle(columns:,spacing: 10, animation: .none)
                .padding(.leading,10)
                .padding(.trailing,10)
                    //content end
                        //if sizeclass closure
        } else {
            //content start
            WaterfallGrid(fetchedRecipes.filter({
//                WaterfallGrid(viewModel.recipes.filter({
                searchText.isEmpty ? true : $0.wTitle.localizedStandardContains(searchText)
            }), id: \.self) { Recipe in
            NavigationLink(destination: DetailRecipeView(recipe: Recipe)) {
                CardRecipeView(recipe: Recipe)
//                            .frame(width: (bounds.size.width/2)-20)
                
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Recipe Title...")
        .gridStyle(columnsInPortrait: 2, columnsInLandscape: 3 ,spacing: 10, animation: .none)
//                .gridStyle(columns:,spacing: 10, animation: .none)
        .padding(.leading,10)
        .padding(.trailing,10)
            //content end
        }
                }
                }
            }
            .navigationTitle("Recipes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
//                    NavigationLink(destination: AddRecipeViewori()){
                    Button(action:{
                        self.isPresentingAddRecipeView.toggle()
                    }){
                        Image(systemName: "plus")
                            .font(.title3)
                            .foregroundColor(.accentColor)
                    }
                        
//                    }
                            
                }
            }
            .fullScreenCover(isPresented: $isPresentingAddRecipeView, content: AddRecipeViewori.init)
        }
        .navigationViewStyle(.stack)
//        .alert(isPresented: $showingSuccessAlert) {
//            Alert(title: Text("Recipe Saved!"),dismissButton: .default(Text("OK")))
//        }
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
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
        
        RecipesView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (3rd generation)"))
        
        
    }
}
