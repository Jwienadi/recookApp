//
//  AddIngredientRowView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 31/03/22.
//

import SwiftUI

//bakcup
//to do: nil check

struct AddIngredientRowView: View {
    
    @Binding var ingredients: [HIngredient]
    let index: Int
    
//    @Binding var qty: String
//    @Binding var selectedUnit: String
//    @Binding var ingredientName: String
//    @Binding var offset: CGFloat
//    @Binding var isSwiped: Bool
    //to do: fix in isinya
//    let units = ["pcs", "kg", "gram", "mL", "L", "tbsp", "tsp", "ounce", "cup", "quart", "pint", "gallon", "pound", "fl. oz."]
    var body: some View {
        ZStack{
            LinearGradient(gradient: .init(colors: [.yellow, .orange]), startPoint: .leading, endPoint: .trailing)
            HStack{
                Spacer()
                Button(action:{
                    ingredients.remove(at: index)
                }){
                    Image(systemName: "trash")
                        .font(.title3)
                        .foregroundColor(.white)
                        .frame(width: 90, height: 40)
                }
            }
        HStack(spacing: 5){
            //MARK: QTY
//            DoubleField(doubleString: $qty)
            DoubleField(doubleString: $ingredients[index].qty)
                .padding()
                .frame(width:50 ,height: 40)
                .background(.white)
                .cornerRadius(8)
            //MARK: PICKER
            Menu{
//                Picker (selection: $selectedUnit, label: EmptyView()) {
                Picker (selection: $ingredients[index].unit, label: EmptyView()) {
                        Text("").tag("")
                ForEach(units, id: \.self) {
                            Text($0).tag($0)
                        }
            }
            .labelsHidden()
              .pickerStyle(InlinePickerStyle())
                } label: {
                    HStack {
//                        Text(selectedUnit)
                        Text(ingredients[index].unit)
                            .frame(width: 75, alignment: .center)

                        Image(systemName: "chevron.down")
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 3))
                        }
                    .foregroundColor(.black)
                    .font(.body)
                    .padding()
                    .frame(height: 40)
                    .background(.white)
                    .cornerRadius(8)
        }
            
        //MARK: ingredient name
//            TextField("Ingredient Name", text: $ingredientName)
            TextField("Ingredient Name", text: $ingredients[index].name)
                .padding()
                .frame(height: 40)
                .background(.white)
                .cornerRadius(8)
                .disableAutocorrection(true)
        Spacer()
        }
        .background(Color("BgColor"))
        .contentShape(Rectangle())
//      ,offset(x: offset)
        .offset(x: ingredients[index].offset)
        .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
        }

    }
    func onChanged(value: DragGesture.Value){
        if value.translation.width < 0 {
//            if isSwiped{
            if ingredients[index].isSwiped{
//                offset = value.translation.width - 90
                ingredients[index].offset = value.translation.width - 90
            } else {
                ingredients[index].offset = value.translation.width
            }
        }
    }
    func onEnd(value: DragGesture.Value){
        
        withAnimation(.easeOut){
        if value.translation.width < 0 {
//            if -value.translation.width > UIScreen.main.bounds.width / 2 {
//                offset = -1000
//            }
            if -ingredients[index].offset > 50 {
                ingredients[index].isSwiped = true
                ingredients[index].offset = -90
            } else {
                ingredients[index].isSwiped = false
                ingredients[index].offset = 0
            }
            } else {
                ingredients[index].isSwiped = false
                ingredients[index].offset = 0
            }
        }
    }
}


