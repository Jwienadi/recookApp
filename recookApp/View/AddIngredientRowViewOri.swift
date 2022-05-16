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
    @Binding var qty: String
    @Binding var selectedUnit: String
    @Binding var ingredientName: String
    @Binding var offset: CGFloat
    @Binding var isSwiped: Bool
    //to do: fix in isinya
    let units = ["pcs", "kg", "gram", "mL", "L", "tbsp", "tsp", "ounce", "cup", "quart", "pint", "gallon", "pound", "fl. oz."]
    var body: some View {
        ZStack{
            LinearGradient(gradient: .init(colors: [.yellow, .orange]), startPoint: .leading, endPoint: .trailing)
            HStack{
                Spacer()
                Button(action:{}){
                    Image(systemName: "trash")
                        .font(.title3)
                        .foregroundColor(.white)
                        .frame(width: 90, height: 40)
                }
            }
        HStack(spacing: 5){
            //MARK: QTY
            DoubleField(doubleString: $qty)
                .padding()
                .frame(width:50 ,height: 40)
                .background(.white)
                .cornerRadius(8)
            //MARK: PICKER
            Menu{
                Picker (selection: $selectedUnit, label: EmptyView()) {
                        Text("").tag("")
                ForEach(units, id: \.self) {
                            Text($0).tag($0)
                        }
            }
            .labelsHidden()
              .pickerStyle(InlinePickerStyle())
                } label: {
                    HStack {

                        Text(selectedUnit)
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
            TextField("Ingredient Name", text: $ingredientName)
                .padding()
                .frame(height: 40)
                .background(.white)
                .cornerRadius(8)
                .disableAutocorrection(true)
        Spacer()
        }
        .background(Color("BgColor"))
        .contentShape(Rectangle())
        .offset(x: offset)
        .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
        }

    }
    func onChanged(value: DragGesture.Value){
        if value.translation.width < 0 {
            if isSwiped{
                offset = value.translation.width - 90
            } else {
                offset = value.translation.width
            }
        }
    }
    func onEnd(value: DragGesture.Value){
        
        withAnimation(.easeOut){
        if value.translation.width < 0 {
//            if -value.translation.width > UIScreen.main.bounds.width / 2 {
//                offset = -1000
//            }
            if -offset > 50 {
                isSwiped = true
                offset = -90
            } else {
                isSwiped = false
                offset = 0
            }
            } else {
                isSwiped = false
                offset = 0
            }
        }
    }
}


