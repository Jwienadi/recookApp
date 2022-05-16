//
//  AddIngredientRowView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 31/03/22.
//

import SwiftUI

struct AddStepRowView: View {
    @Binding var step: String
    @State var order: Int
    @Binding var showTimer: Bool
    //was state
    @Binding var hour: String
    @Binding var minute: String
    
//    @Binding var ingredient: [Ingredient]
//    let units = ["kg", "g", "tbsp", "tsp", "mL", "L", "ounces", "pcs", "cup"]
    var body: some View {
        VStack{
        HStack(spacing: 5){
        //ingredient name
            Text(String(order)+".")
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                .padding(.leading)
                .frame(height: 40)
            
            TextField("Step \(order)...", text: $step)
                .padding(.leading)
                .frame(height: 40)
                .disableAutocorrection(true)
                .textInputAutocapitalization(.never)
                .background(.white)
                .cornerRadius(8)
            VStack(alignment:.center){
                Text("Timer")
                    .font(.footnote)
                Toggle("", isOn: $showTimer)
                    .labelsHidden()
            }
            
        }
        .padding(10)
        .frame(maxHeight: .infinity)
//        .background(Color.red)
            if showTimer{
                HStack(alignment:.lastTextBaseline){
                Spacer()
                    hourMinuteTextFieldView(hour: $hour, minute: $minute)
                }
                .padding(.trailing)
            }
        }
        

    }
    
}

//}

//struct AddStepRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        let test = "goreng hingga kuning kecokelatan"
//        AddStepRowView(step: .constant(test), order: 1, showTimer: false, hour: .constant(String(5)), minute: .constant(String(20)))
//    }
//}
//struct StatefulPreviewWrapper<Value, Content: View>: View {
//    @State var value: Value
//    var content: (Binding<Value>) -> Content
//
//    var body: some View {
//        content($value)
//    }
//
//    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
//        self._value = State(wrappedValue: value)
//        self.content = content
//    }
//}
