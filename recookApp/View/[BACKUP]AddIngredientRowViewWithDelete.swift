////
////  AddIngredientRowView.swift
////  recookApp
////
////  Created by Jessica Wienadi on 31/03/22.
////
//
//import SwiftUI
//
//struct AddIngredientRowViewWithDelete: View {
//    @Binding var ingredient: HIngredient
//    @Binding var ingredients: [HIngredient]
////    @Binding var ingredient: [Ingredient]
//    let units = ["kg", "g", "tbsp", "tsp", "mL", "L", "ounces", "pcs", "cup"]
//    var body: some View {
//        ZStack{
//            LinearGradient(gradient: .init(colors: [.yellow, .orange]), startPoint: .leading, endPoint: .trailing)
//            HStack{
//                Spacer()
//                Button(action:{
//                    withAnimation(.easeIn){deleteItem()}
//                }){
//                    Image(systemName: "trash")
//                        .font(.title3)
//                        .foregroundColor(.white)
//                        .frame(width: 90, height: 40)
//                }
//            }
//        HStack(spacing: 5){
//            //MARK: QTY
//            DoubleField(doubleString: $ingredient.qty)
//                .padding()
//                .frame(width:50 ,height: 40)
//                .background(.white)
//                .cornerRadius(8)
//            //MARK: PICKER
//            Menu{
//                Picker (selection: $ingredient.unit, label: EmptyView()) {
//                        Text("").tag("")
//                ForEach(units, id: \.self) {
//                            Text($0).tag($0)
//                        }
//            }
////            .labelsHidden()
////            .pickerStyle(DefaultPickerStyle())
//            .labelsHidden()
//              .pickerStyle(InlinePickerStyle())
//                } label: {
//                    HStack {
////                        Rectangle()
////                            .foregroundColor(Color(.systemBackground))
////                            .frame(height: 40)
//                        Text(ingredient.unit)
//                            .frame(width: 75, alignment: .center)
////                        Text("⌵")
////                            .offset(y: -4)
//                        Image(systemName: "chevron.down")
//                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 3))
//                        }
//                    .foregroundColor(.black)
//                    .font(.body)
//                    .padding()
//                    .frame(height: 40)
////                    .frame(minWidth: 70, maxWidth: 50)
//                    .background(.white)
//                    .cornerRadius(8)
////                    .overlay(
////                        RoundedRectangle(cornerRadius: 5)
////                            .stroke(Color.black, lineWidth: 1)
////                    )
////                    .overlay(
////                        Text(selectedUnit ?? "")
////                    )
////                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
//
//
//        }
//            
//        //MARK: ingredient name
//            TextField("Ingredient Name", text: $ingredient.name)
//                .padding()
//                .frame(height: 40)
//                .background(.white)
//                .cornerRadius(8)
//        Spacer()
//        }
//        .background(Color("BgColor"))
//        .contentShape(Rectangle())
//        .offset(x: ingredient.offset)
//        .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
//        }
//
//    }
//    func onChanged(value: DragGesture.Value){
//        if value.translation.width < 0 {
//            if ingredient.isSwiped{
//                ingredient.offset = value.translation.width - 90
//            } else {
//                ingredient.offset = value.translation.width
//            }
//        }
//    }
//    func onEnd(value: DragGesture.Value){
//        
//        withAnimation(.easeOut){
//        if value.translation.width < 0 {
////            if -value.translation.width > UIScreen.main.bounds.width / 2 {
////                offset = -1000
////            }
//            if -ingredient.offset > 50 {
//                ingredient.isSwiped = true
//                ingredient.offset = -90
//            } else {
//                ingredient.isSwiped = false
//                ingredient.offset = 0
//            }
//            } else {
//                ingredient.isSwiped = false
//                ingredient.offset = 0
//            }
//        }
//    }
//    
//    func deleteItem() {
//            ingredients.removeAll { (ingredient) -> Bool in
//                return self.ingredient.id == ingredient.id
//            }
//        }
//}
//
////struct AddIngredientRowView: View {
////    @State private var fruit : String = ""
////    var fruits = ["a","b","c","d"]
////    var body: some View {
////    Menu {
////        Picker(selection: $fruit, label: EmptyView()) {
////            ForEach(fruits, id: \.self) { fruit in
////                Text(fruit)
////            }
////        }
////        .labelsHidden()
////        .pickerStyle(InlinePickerStyle())
////    } label: {
////        HStack {
////            Text(fruit)
////            Text("⌵")
////        }
////    }
////    }
////}
//
////struct AddIngredientRowView_Previews: PreviewProvider {
////    static var previews: some View {
////        AddIngredientRowView()
////    }
////}
