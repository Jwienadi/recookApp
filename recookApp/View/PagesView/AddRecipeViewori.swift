//
//  AddRecipeView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 28/03/22.
//

import SwiftUI

struct AddRecipeViewori: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentation
    @State private var showingSuccessAlert = false
    @StateObject private var viewModel = AddRecipeViewModel()
    //    @State var steps: [HStep] = [HStep(step_text: "",hourDuration: "", minuteDuration: "")]
    
    //image vars
    @State private var showImage: Bool = false
    @State private var isShowingImagePicker: Bool = false
    @State private var sourceType : UIImagePickerController.SourceType = .photoLibrary
    @State private var isIngPasteViewPresented = false
    
    //dataHelper gajadi pake indexnya. pke 1 array aja trs call indices pas saving di forloop. Lihat ss
    
    @State private var showPasteView = false
    var body: some View {
        //        NavigationView{
        ScrollView {
            VStack(alignment: .leading, spacing: 5){
               //MARK: IMAGE
                if viewModel.image.count != 0 {
                    
                    Button(action: {
                        
                        self.isShowingImagePicker.toggle()
                        
                    }) {
                        //view ipad masih uglyyy too wide
                        Image(uiImage: UIImage(data: viewModel.image)!)
                            .renderingMode(.original)
                            .resizable()
                            .frame(maxWidth: .infinity)
                        //                        .scaledToFill()
                        //                        .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .padding(.bottom)
                        //                        .cornerRadius(10)
                        //                        .shadow(color: Color("light"), radius: 10, x: -10, y: -10)
                        //                        .shadow(color: Color("dark"), radius: 10, x: 10, y: 10)
                        
                    }
                    .actionSheet(isPresented: self.$isShowingImagePicker) {
                        ActionSheet(title: Text("Select anyone"), message: Text("Please select one of the option."), buttons: [.default(Text("Camera")) {
                            self.sourceType = .camera
                            self.showImage.toggle()
                            
                            
                        }, .default(Text("PhotoLibrary")) {
                            self.sourceType = .photoLibrary
                            self.showImage.toggle()
                            
                        },  .cancel()])
                    }
                } else {
                    
                    Button(action: {
                        
                        self.isShowingImagePicker.toggle()
                        
                    }) {
                        Image(uiImage: UIImage(named: "default")!)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 200)
                        //                    .frame(height: 200)
                            .padding(.bottom)
                        //                    .cornerRadius(10)
                        //                    .shadow(color: Color("light"), radius: 10, x: -10, y: -10)
                        //                    .shadow(color: Color("dark"), radius: 10, x: 10, y: 10)
                    }
                    .actionSheet(isPresented: self.$isShowingImagePicker) {
                        ActionSheet(title: Text("Select anyone"), message: Text("Please select one of the option."), buttons: [.default(Text("Camera")) {
                            self.sourceType = .camera
                            self.showImage.toggle()
                            
                            
                        }, .default(Text("PhotoLibrary")) {
                            self.sourceType = .photoLibrary
                            self.showImage.toggle()
                            
                        },  .cancel()])
                    }
                }
                //MARK: HEADER DATA
                Group {
                    //title tf
                    StringInputForm(data: $viewModel.title, inputName: "Title", placeholder: "Recipe Title")
                    //                            .padding(.horizontal)
                    
                    
                    //category picker
                    HStack(alignment: .firstTextBaseline){
                        Text("Category")
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
                            .padding(.leading)
                        Picker ("Category", selection: $viewModel.selectedCategory) {
                            //                                        Text("No Category").tag(nil as Int?)
                            ForEach(viewModel.categories, id: \.self) {
                                Text($0).tag($0)
                            }
                        }
                        Spacer()
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.white)
                    .cornerRadius(5)
                    //                        .padding(.horizontal)
                    //                        .pickerStyle(WheelPickerStyle())
                    
                    //source tf
                    StringInputForm(data: $viewModel.source, inputName: "Source", placeholder: "Recipe Source")
                    //                                .padding(.horizontal)
                    
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
                            Text("Cook. Time")
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
                                .frame(width: 106, alignment: .leading)
                                .fixedSize()
                            hourMinuteTextFieldView(hour: $viewModel.cookhour, minute: $viewModel.cookminute)
                            Spacer()
                        }
                        .padding(.leading)
                        
                    }
                    
                    //                        .padding(.horizontal)
                    
                    
                    //yield
                    HStack(){
                        Text("Yield")
                        //                                .frame(align: .leading)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
                            .frame(width: 106, alignment: .leading)
                            .fixedSize()
                        IntField(intString: $viewModel.yield)
                            .padding(10)
                            .background(.white)
                            .cornerRadius(8)
                        Text("Servings")
                        //                            Spacer()
                    }
                    .padding(.leading)
                    //                        .padding(.horizontal)
                    
                    
                    //note
                    StringInputForm(data: $viewModel.note, inputName: "Note", placeholder: "")
                    //                        Spacer()
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
                            isPasteViewPresented.toggle()
                        }
                        .frame(alignment: .trailing)
                        .padding(.trailing)
                    }
                    //                        .padding(.horizontal)
                    
                    
                    //ingredient list
                    ForEach(0..<viewModel.ingredients.count, id:\.self){ index in
                        AddIngredientRowView(qty: $viewModel.ingredients[index].qty, selectedUnit: $viewModel.ingredients[index].unit, ingredientName: $viewModel.ingredients[index].name,offset: $viewModel.ingredients[index].offset, isSwiped: $viewModel.ingredients[index].isSwiped)
                        
                    }
                    .padding(.leading)
                    
                    //add new row
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
                        //row
                        ForEach(0..<viewModel.steps.count, id:\.self ){ index in
                            
                            AddStepRowView(step: $viewModel.steps[index].step_text, order: index+1, hour: $viewModel.steps[index].hourDuration, minute: $viewModel.steps[index].minuteDuration)
                        }
                        .padding(.leading)
                        
                        
                        Button{
                            viewModel.steps.append(HStep(step_text: "",hourDuration: "", minuteDuration: ""))
                        } label:{
                            Label("Add", systemImage: "plus")
                        }
                        //                        .padding(.horizontal)
                        .padding(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                }
                .padding(.top)
                
                //----------------------new--------------
                
                
                Spacer()
                
                    .navigationTitle("Add Recipe")
                    .navigationBarTitleDisplayMode(.inline)
                
                
            }
            //        .padding(.horizontal)
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: .infinity)
            .background(Color("BgColor"))
            .navigationTitle("Add Recipe")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    //ganti
                    Button("Save") {
                        viewModel.addRecipe(context: viewContext)
                        showingSuccessAlert = true
                        presentation.wrappedValue.dismiss()
                        
                    }
                    .alert(isPresented: $showingSuccessAlert) {
                        Alert(title: Text("Recipe Saved!"),dismissButton: .default(Text("OK")))
                    }
                }}
        }
        .modifier(Popup(isPresented: isIngPasteViewPresented, alignment: .center, content: PasteViewIngredient(isPresented: $isIngPasteViewPresented, ingredients: $viewModel.ingredients)))
        //This will call the image picker
        .sheet(isPresented: self.$showImage) {
            ImagePicker(images: $viewModel.image, show: self.$showImage, sourceType: self.sourceType)
            
            
        }
        
        
    }
    
    
}

struct AddRecipeViewori_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeViewori()
    }
}



