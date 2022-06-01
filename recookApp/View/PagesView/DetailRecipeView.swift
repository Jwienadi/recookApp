//
//  DetailRecipeView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 01/04/22.
//

import SwiftUI
struct DetailRecipeView: View {
    @Environment(\.managedObjectContext) var mangedObjectContext
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
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .clipped()
                        .padding(.bottom)
                } else {
                    ZStack(alignment: .center){
                        Rectangle()
                            .fill(Color.accentColor)
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .cornerRadius(5)
                        Image(systemName: "fork.knife")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                    }
                }
                Text(recipe.wTitle)
                    .font(Font.title3.bold())
                Group{
                    HStack(alignment: .center, spacing: 15){
                        DetailInfoView(infoTitle: "Prep Time", infoText: "\(recipe.prepString)")
                        Divider()
                        DetailInfoView(infoTitle: "Cook Time", infoText: "\(recipe.cookString)")
                        Divider()
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
                    Text(recipe.wSource)
                        .font(.callout)
                }
                HStack(){
                    Text("Note")
                        .font(Font.callout.bold())
                    Text(recipe.wNote)
                        .font(.callout)
                }
                Text("Ingredients")
                    .font(Font.callout.bold())
                ForEach(recipe.ingredientArray) { ing in
                    Text("\(ing.qtyString) \(ing.wUnit) \(ing.wName)")
                }
                
                Text("Steps")
                    .font(Font.callout.bold())
                
                ForEach(recipe.stepArray) { ing in
                    Text("\(ing.order).  \(ing.wStep_text)")
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .navigationTitle("Recipe")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Cook"){
                        startCooking.toggle()
                    }
                    Menu(content: {
                        Button(action:{
                            showEditView.toggle()
                        }){
                            Label("Edit Recipe", systemImage: "pencil")
                        }
                        
                        
                        Button(role: .destructive, action: {
                            showDeleteAlert.toggle()
                        }) {
                            Label("Delete Recipe", systemImage: "trash")
                        }
                    }, label: {Image(systemName: "ellipsis.circle")
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
