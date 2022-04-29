////
////  AddRecipeView.swift
////  recookApp
////
////  Created by Jessica Wienadi on 28/03/22.
////
//
//import SwiftUI
//
//struct AddRecipeView: View {
////    @Environment(\.managedObjectContext) var managedObjectContext
//    var categories = ["Others","Breakfast", "Lunch", "Dinner", "Soup", "Rice", "Beverages"]
//    @State private var isShowingPhotoPicker = false
//    @State private var title = ""
//    @State private var selectedCategory = "Breakfast"
//    @State private var selectedCategoryIndex = 0
//    @State private var source = ""
//    @State private var prephour = ""
////    @ObservedObject var prephour = TextLimiter(limit: 4)
//    @State private var prepminute = ""
//    @State private var cookhour = ""
//    @State private var cookminute = ""
//    var body: some View {
//        NavigationView{
//        
//        VStack(alignment: .leading){
//       
////                    Image(uiImage: UIImage(named: "default")!)
////                        .resizable()
////                        .scaledToFit()
////                        .frame(maxWidth: .infinity)
//            Form{
//                        StringInputForm(data: $title, inputName: "Title", placeholder: "Recipe Title")
//                            Picker(selection: $selectedCategoryIndex, label: Text("Categories")) {
//                                ForEach(0 ..< categories.count, id: \.self) {
//                                                    Text(self.categories[$0])
//                                                }}
//                            StringInputForm(data: $source, inputName: "Source", placeholder: "Recipe Origin")
//                        HStack{
//                            Text("Prep. Time")
//                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
//                                .lineLimit(1)
//                                .frame(maxWidth: .infinity)
//                            IntField(intString: $prephour)
//                            Text("Hour")
//                            IntField(intString: $prepminute)
//                            Text("Minute")
//                            Spacer()
//                        }
//            }
////            .foregroundColor(.black)
////            .accentColor(.orange)
//                    
////                    Spacer()
////                    .padding(.horizontal)
////            .padding(.horizontal)
//            
//                .navigationTitle("Add Recipe")
//                .navigationBarTitleDisplayMode(.inline)
//                .sheet(isPresented: $isShowingPhotoPicker, content: {
//                })
////        }
//        
//    }
////        .navigationTitle("Add Recipe")
////        .navigationBarTitleDisplayMode(.inline)
////        .toolbar {
////            ToolbarItem(placement: .navigationBarTrailing){
////                //ganti
////                Button("Press Me") {
////                    print("Pressed")
////                }
////            }
////        .background(Color.secondary)
//    }
//        }
//        
//}
//
//struct AddRecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddRecipeView()
//    }
//}
