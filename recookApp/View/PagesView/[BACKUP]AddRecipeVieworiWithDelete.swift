////
////  AddRecipeView.swift
////  recookApp
////
////  Created by Jessica Wienadi on 28/03/22.
////
//
//import SwiftUI
//
//struct AddRecipeVieworiWithDelete: View {
////    @Environment(\.managedObjectContext) var managedObjectContext
//    @StateObject private var viewModel = AddRecipeViewModel()
//    //header datas create struct too?
////    @State var ingredientsCount = 1
////    @State var ingredientsCountHelper = 1
////    @State var ingredients: [HIngredient] = [HIngredient(qty: "", unit: "", name: "", offset: 0, isSwiped: false)]
////
////    @State var stepsCount = 1
////    @State var stepsCountHelper = 1
//    @State var steps: [HStep] = [HStep(step_text: "",hourDuration: "", minuteDuration: "")]
//    
//    //dataHelper gajadi pake indexnya. pke 1 array aja trs call indices pas saving di forloop. Lihat ss
//    
//    @State private var showPasteView = false
//    var body: some View {
////        NavigationView{
//        ScrollView {
//        VStack(alignment: .leading, spacing: 5){
//                    //add image
//                    Image(uiImage: UIImage(named: "default")!)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(maxWidth: .infinity)
//                        .padding(.bottom)
//            Group{
//                        //title tf
//                        StringInputForm(data: $viewModel.title, inputName: "Title", placeholder: "Recipe Title")
////                            .padding(.horizontal)
//                        
//                            
//                        //category picker
//                        HStack(alignment: .firstTextBaseline){
//                        Text("Category")
//                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
//                            .padding(.leading)
//                            Picker ("Category", selection: $viewModel.selectedCategory) {
//                                        Text("No Category").tag(nil as Int?)
//                                ForEach(viewModel.categories, id: \.self) {
//                                            Text($0).tag($0)
//                                        }
//                            }
//                            Spacer()
//                        }
//                        .padding(10)
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        .background(.white)
//                        .cornerRadius(5)
////                        .padding(.horizontal)
////                        .pickerStyle(WheelPickerStyle())
//                        
//                        //source tf
//                            StringInputForm(data: $viewModel.source, inputName: "Source", placeholder: "Recipe Source")
////                                .padding(.horizontal)
//                        
//                        //prep time tf
//            Group{
//                        HStack{
//                            Text("Prep. Time")
//                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
//                                .frame(width: 106, alignment: .leading)
//                                .fixedSize()
//                            hourMinuteTextFieldView(hour: $viewModel.prephour, minute: $viewModel.prepminute)
//                            Spacer()
//                        }
//                        .padding(.leading)
//            }
//                        
//                        
//                        //cook time tf
//            Group{
//                        HStack{
//                            Text("Cook. Time")
//                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
//                                .frame(width: 106, alignment: .leading)
//                                .fixedSize()
//                            hourMinuteTextFieldView(hour: $viewModel.cookhour, minute: $viewModel.cookminute)
//                            Spacer()
//                        }
//                        .padding(.leading)
//        
//            }
//                        
////                        .padding(.horizontal)
//                        
//                        
//                        //yield
//                        HStack(){
//                            Text("Yield")
////                                .frame(align: .leading)
//                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
//                                .frame(width: 106, alignment: .leading)
//                                .fixedSize()
//                            IntField(intString: $viewModel.yield)
//                                .padding(10)
//                                .background(.white)
//                                .cornerRadius(8)
//                            Text("Servings")
////                            Spacer()
//                        }
//                        .padding(.leading)
////                        .padding(.horizontal)
//                        
//                        
//                        //note
//                        StringInputForm(data: $viewModel.note, inputName: "Note", placeholder: "")
////                        Spacer()
//            }
//                        //INGREDIENTS
//                        Group{
//                        //ingredients + popup
//                        HStack{
//                            Text("Ingredients")
//                                .frame(alignment: .leading)
//                                .padding(.leading)
//                                .font(Font.body.weight(.semibold))
//                            Spacer()
//                            Button("Paste and add"){
//                                
//                            }
//                            .frame(alignment: .trailing)
//                            .padding(.trailing)
//                        }
////                        .padding(.horizontal)
//                        
//                        
//                        //ingredient list
////                            List{
//                            ForEach(0..<viewModel.ingredients.count, id: \.self){ ing in
////
//                                AddIngredientRowView(ingredient: $viewModel.ingredients[ing], ingredients: $viewModel.ingredients
//                            )
//                                
////                        .onChange(of: ingredients[index]) { value in
////                            viewModel.ingredients[index].qty = value.qty
////                            viewModel.ingredients[index].unit = value.unit
////                            viewModel.ingredients[index].name = value.name
//                                    }
////                        }
//                           
//                            
////                            }
//                        .padding(.leading)
////                        .listStyle(.plain)
////                        .aspectRatio(contentMode: .fit)
////                        .padding(.horizontal)
////                            List(0..<ingredientsCount, id:\.self) { index in
////                                AddIngredientRowView(qty: self.$ingredients[index].qty, selectedUnit: self.$ingredients[index].unit, ingredientName: self.$ingredients[index].name)
////                            }
////                            .padding(.leading)
////                            .listStyle(.plain)
////
//                        //add row button
//    //ini -------------w counter----------------------------------------
////                        Button{
////                            lazy var order: Int = {
////                                ingredientsCountHelper += 1
////                                return ingredientsCountHelper
////                            }()
////                            ingredients.append(HIngredient(qty: "", unit: "", name: "", order: order))
////                            ingredientsCount.self += 1
//////                            ingredientsCountHelper.self += 1
////                        } label:{
////                            Label("Add", systemImage: "plus")
////                        }
//////                        .padding(.horizontal)
////                        .padding(.trailing)
////                        .frame(maxWidth: .infinity, alignment: .trailing)
////                        }
////                        .padding(.top)
////ini -------------w counter----------------------------------------
//            
//                            Button{
//                                viewModel.ingredients.append(HIngredient(qty: "", unit: "", name: "", offset: 0, isSwiped: false))
//                            } label:{
//                                Label("Add", systemImage: "plus")
//                            }
//    //                        .padding(.horizontal)
//                            .padding(.trailing)
//                            .frame(maxWidth: .infinity, alignment: .trailing)
//                            }
//                            .padding(.top)
//                            
//    //ini ------------------------wo counter--------
//                        //STEP
//                        Group{
//                        VStack{
//                            HStack{
//                            //step title
//                            Text("Step")
//                                .frame(alignment: .leading)
//                                .padding(.leading)
//                                .font(Font.body.weight(.semibold))
//                            Spacer()
//                            Button("Paste and add"){
//                                
//                            }
//                            .frame(alignment: .trailing)
//                            .padding(.trailing)
//                            }
//                            //row
//                            ForEach(0..<steps.count, id:\.self ){ index in
//                                
//                                AddStepRowView(step: self.$steps[index].step_text, order: index+1, hour: self.$steps[index].hourDuration, minute: self.$steps[index].minuteDuration)
//                            }
//                            .padding(.leading)
//                            
//                            //add row button
//     //---------------------------old--------------------------------
////                            Button{
////                                lazy var order: Int = {
////                                    stepsCountHelper += 1
////                                    return stepsCountHelper
////                                }()
////                                steps.append(HStep(step_text: "", order: order))
////                                stepsCount.self += 1
//////                                stepsCountHelper.self += 1
////                                print(stepsCount)
////                                print(stepsCountHelper)
////                            } label:{
////                                Label("Add", systemImage: "plus")
////                            }
////    //                        .padding(.horizontal)
////                            .padding(.trailing)
////                            .frame(maxWidth: .infinity, alignment: .trailing)
////                            }
////
////                        }
////                        .padding(.top)
//        //---------------------------old--------------------------------
//                            Button{
//                                steps.append(HStep(step_text: "",hourDuration: "", minuteDuration: ""))
//                            } label:{
//                                Label("Add", systemImage: "plus")
//                            }
//    //                        .padding(.horizontal)
//                            .padding(.trailing)
//                            .frame(maxWidth: .infinity, alignment: .trailing)
//                            }
//                        
//                        }
//                        .padding(.top)
//                        
//                      //----------------------new--------------
//                        
//            
//            Spacer()
//
//                .navigationTitle("Add Recipe")
//                .navigationBarTitleDisplayMode(.inline)
////                .sheet(isPresented: $isShowingPhotoPicker, content: {
////                })
////        }
//            
//
//    }
////        .padding(.horizontal)
//        .fixedSize(horizontal: false, vertical: true)
//        .frame(maxWidth: .infinity)
//        .background(Color("BgColor"))
//        .navigationTitle("Add Recipe")
//        .navigationBarTitleDisplayMode(.inline)
//        .toolbar {
//            ToolbarItem(placement: .navigationBarTrailing){
//                //ganti
//                Button("Press Me") {
//                    print("Pressed")
//                }
//            }}
//            // scrollviewclose
//            }
//        
//        
//    }
//
//    func getIndex(ingredient: HIngredient) -> Int {
//           return viewModel.ingredients.firstIndex { (ing1) -> Bool in
//               return ingredient.id == ing1.id
//           } ?? 0
//       }
//    
//}
//
//struct AddRecipeViewori_Previews: PreviewProvider {
//    static var previews: some View {
//        AddRecipeViewori()
//    }
//}
