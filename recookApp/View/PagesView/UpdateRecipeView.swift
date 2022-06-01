//
//  UpdateRecipeView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 04/05/22.
//

import SwiftUI

struct UpdateRecipeView: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentation
    @State private var showingSuccessAlert = false
    
    @ObservedObject private var viewModel: UpdateRecipeViewModel
    let cdRecipe: Recipe
    init(recipe: Recipe) {
        self.cdRecipe = recipe
        self.viewModel = UpdateRecipeViewModel(recipe: recipe)
    }

    @State private var showImage: Bool = false
    @State private var isShowingImagePicker: Bool = false
    @State private var sourceType : UIImagePickerController.SourceType = .photoLibrary
    @State private var isIngPasteViewPresented = false
    

    @State private var showPasteView = false
    let timerOn = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5){
               //MARK: IMAGE
                if viewModel.image.count != 0 {
                    
                    Button(action: {
                        
                        self.isShowingImagePicker.toggle()
                        
                    }) {
                        Image(uiImage: UIImage(data: viewModel.image)!)
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .clipped()
                            .padding(.bottom)
                    }
                    .actionSheet(isPresented: self.$isShowingImagePicker, content: {
                        var buttons: [ActionSheet.Button] = [ActionSheet.Button.default(Text("Photo Library"), action: {
                        self.sourceType = .photoLibrary
                        self.showImage.toggle()})]
                        if viewModel.image.isEmpty == false {
                            buttons.append(ActionSheet.Button.destructive(Text("Remove Image"), action: {
                                viewModel.image.count = 0
                            }))
                               }
                            buttons.append(.cancel())

                            return ActionSheet(title: Text("Upload Image"), buttons: buttons)
                        })
//                    .actionSheet(isPresented: self.$isShowingImagePicker) {
//                        ActionSheet(title: Text("Upload Image"), buttons: [.default(Text("PhotoLibrary")) {
//                            self.sourceType = .photoLibrary
//                            self.showImage.toggle()
//
//                        },  .cancel()])
//                    }
                } else {
                    
                    Button(action: {
                        
                        self.isShowingImagePicker.toggle()
                        
                    }) {
                        Image(uiImage: UIImage(named: "default")!)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .padding(.bottom)
                    }
                    .actionSheet(isPresented: self.$isShowingImagePicker, content: {
                        var buttons: [ActionSheet.Button] = [ActionSheet.Button.default(Text("Photo Library"), action: {
                        self.sourceType = .photoLibrary
                        self.showImage.toggle()})]
                        if viewModel.image.isEmpty == false {
                            buttons.append(ActionSheet.Button.destructive(Text("Remove Image"), action: {
                                viewModel.image.count = 0
                            }))
                               }
                            buttons.append(.cancel())

                            return ActionSheet(title: Text("Upload Image"), buttons: buttons)
                        })
//                    .actionSheet(isPresented: self.$isShowingImagePicker) {
//                        ActionSheet(title: Text("Upload Image"), buttons: [.default(Text("PhotoLibrary")) {
//                            self.sourceType = .photoLibrary
//                            self.showImage.toggle()
//
//                        },  .cancel()])
//                    }
                }
                //MARK: HEADER DATA
                Group {
                    //title tf
                    StringInputForm(data: $viewModel.title, inputName: "Title", placeholder: "Recipe Title")

                    //category picker
                    HStack(alignment: .firstTextBaseline){
                        Text("Category")
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
                            .padding(.leading)
                        Picker ("Category", selection: $viewModel.selectedCategory) {
                            //                                        Text("No Category").tag(nil as Int?)
                            ForEach(categories, id: \.self) {
                                Text($0).tag($0)
                            }
                        }
                        Spacer()
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.white)
                    .cornerRadius(5)
                    
                    //source tf
                    StringInputForm(data: $viewModel.source, inputName: "Source", placeholder: "Recipe Source")
                    
                    //prep time tf
                    Group{
                        HStack{
                            Text("Prep. Time")
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
                                .frame(width: 106, alignment: .leading)
                                .fixedSize()
                            hourMinuteTextFieldView(hour: $viewModel.prephour, minute: $viewModel.prepminute)
                            Spacer()
                        }
                        .padding(.leading)
                    }
                    
                    
                    //cook time tf
                    Group{
                        HStack{
                            Text("Cook Time")
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
                                .frame(width: 106, alignment: .leading)
                                .fixedSize()
                            hourMinuteTextFieldView(hour: $viewModel.cookhour, minute: $viewModel.cookminute)
                            Spacer()
                        }
                        .padding(.leading)
                        
                    }
                    //yield
                    HStack(){
                        Text("Yield")
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
                            .frame(width: 106, alignment: .leading)
                            .fixedSize()
                        IntField(intString: $viewModel.yield)
                            .padding(10)
                            .background(.white)
                            .cornerRadius(8)
                        Text("Servings")
                    }
                    .padding(.leading)

                    //note
                    StringInputForm(data: $viewModel.note, inputName: "Note", placeholder: "")
                }
                //MARK: INGREDIENTS
                Group{
                    //ingredients + popup
                    HStack{
                        Text("Ingredients")
                            .frame(alignment: .leading)
                            .padding(.leading)
                            .font(Font.body.weight(.semibold))
                        Spacer()
                        Button("Paste and add"){
                            isIngPasteViewPresented.toggle()
                        }
                        .frame(alignment: .trailing)
                        .padding(.trailing)
                    }
                    
                    
                    //ingredient list
                    ForEach(0..<viewModel.ingredients.count, id:\.self){ index in

                        AddIngredientRowView(ingredients: $viewModel.ingredients, index: index)
                        
                    }
                    .padding(.leading)
                    
                    //Add new row
                    Button{
                        viewModel.ingredients.append(HIngredient(qty: "", unit: "", name: "", offset: 0, isSwiped: false))
                    } label:{
                        Label("Add", systemImage: "plus")
                    }
                    
                    .padding(.trailing)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.top)
       
                //MARK: STEP
                Group{
                    VStack{
                        HStack{
                            //step title
                            Text("Step")
                                .frame(alignment: .leading)
                                .padding(.leading)
                                .font(Font.body.weight(.semibold))
                            Spacer()
                            Button("Paste and add"){
                                
                            }
                            .frame(alignment: .trailing)
                            .padding(.trailing)
                        }
                        //Add new row
                        ForEach(0..<viewModel.steps.count, id:\.self ){ index in
                            AddStepRowView(steps: $viewModel.steps, index: index)
                        }
                        .padding(.leading)
                        
                        
                        Button{
                            viewModel.steps.append(HStep(step_text: "",hourDuration: "", minuteDuration: "", timerOn: false, offset: 0, isSwiped: false))
                        } label:{
                            Label("Add", systemImage: "plus")
                        }
                        .padding(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                }
                .padding(.top)
                
                Spacer()
                
 
            }
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: .infinity)
            .background(Color("BgColor"))
            .navigationTitle("Edit Recipe")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    //ganti
                    Button("Save") {
                        viewModel.updateRecipe(context: viewContext, updateRecipe: cdRecipe)
                        showingSuccessAlert = true
                        presentation.wrappedValue.dismiss()
                        
                    }
                    .alert(isPresented: $showingSuccessAlert) {
                        Alert(title: Text("Recipe Saved!"),dismissButton: .default(Text("OK")))
                    }
                }}
        }

        .popover(isPresented: $isIngPasteViewPresented) { PasteViewIngredient.init(isPresented: $isIngPasteViewPresented, ingredients: $viewModel.ingredients)}
        .sheet(isPresented: self.$showImage) {
            ImagePicker(images: $viewModel.image, show: self.$showImage, sourceType: self.sourceType)
            
            
        }
        
        
    }
    
    
}

//struct UpdateRecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateRecipeView()
//    }
//}
