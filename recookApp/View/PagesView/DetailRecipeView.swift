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
    
    @ObservedObject var recipe: Recipe
    @State private var showDeleteAlert = false
    @State private var showEditView = false
    @State private var startCooking = false
    
    
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
                    Text("\(ing.qtyString) \(ing.wUnit) \(ing.wName)")
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
                        startCooking.toggle()
                    }
                    Menu(content: {
                        Button(action:{
                            showEditView.toggle()
//                            recipe.objectWillChange.send()
                        }){
                                Label("Edit Recipe", systemImage: "pencil")
                        }
                            //plan: pake add recipevm tp if update, datanya diisi dulu? ad tutor u2b cb cek
                            
                            
                        Button(role: .destructive, action: {
                            showDeleteAlert.toggle()
                    
                            //DELETE OK, but add alert!!!
                            
                        }) {
                                Label("Delete Recipe", systemImage: "trash")
                            }
                            }, label: {Image(systemName: "ellipsis.circle")
//                                    .font(.title3)
                                .foregroundColor(.accentColor)})
                    .alert(isPresented:$showDeleteAlert) {
                                Alert(
                                    title: Text("Are you sure you want to delete this recipe?"),
                                    message: Text("This action cannot be undone"),
                                    primaryButton: .destructive(Text("Delete")) {
                                        PersistenceController.shared.delete(recipe)
                                    },
                                    secondaryButton: .cancel()
                                )
                            }
                }
            }
            NavigationLink("", destination: UpdateRecipeView(recipe: recipe), isActive: $showEditView)
//            NavigationLink("", destination: cookView(recipe: recipe), isActive: $startCooking)
        }
        .fullScreenCover(isPresented: $startCooking, onDismiss: {UIApplication.shared.isIdleTimerDisabled = true}){cookView(recipe: recipe)}
        
    }

}


//
//struct DetailRecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailRecipeView(recipe: PersistenceController.preview.container.viewContext.registeredObjects.first(where: { $0 is Recipe }) as! Recipe).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//        
//    }
//}
