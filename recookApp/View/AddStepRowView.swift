//
//  AddIngredientRowView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 31/03/22.
//

import SwiftUI

struct AddStepRowView: View {
    @Binding var steps: [HStep]
    var index: Int
//
//    @Binding var step: String
//    @State var order: Int
//    @Binding var showTimer: Bool
//    //was state
//    @Binding var hour: String
//    @Binding var minute: String
    
//    @Binding var ingredient: [Ingredient]
//    let units = ["kg", "g", "tbsp", "tsp", "mL", "L", "ounces", "pcs", "cup"]
    var body: some View {
        ZStack{
            LinearGradient(gradient: .init(colors: [.yellow, .orange]), startPoint: .leading, endPoint: .trailing)
            HStack{
                Spacer()
                Button(action:{
                    steps.remove(at: index)
                }){
                    Image(systemName: "trash")
                        .font(.title3)
                        .foregroundColor(.white)
                        .frame(width: 90, height: 40)
                }
            }
        VStack{
        HStack(spacing: 5){
        //ingredient name
            Text(String(index+1)+".")
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                .padding(.leading)
                .frame(height: 40)
            
            TextField("Step \(index+1)...", text: $steps[index].step_text)
                .padding(.leading)
                .frame(height: 40)
                .disableAutocorrection(true)
                .textInputAutocapitalization(.never)
                .background(.white)
                .cornerRadius(8)
            VStack(alignment:.center){
                Text("Timer")
                    .font(.footnote)
                Toggle("", isOn: $steps[index].timerOn)
                    .labelsHidden()
            }
            
        }
        .padding(10)
        .frame(maxHeight: .infinity)
//        .background(Color.red)
//            if showTimer{
            if steps[index].timerOn{
                HStack(alignment:.lastTextBaseline){
                Spacer()
                    hourMinuteTextFieldView(hour: $steps[index].hourDuration, minute: $steps[index].minuteDuration)
                }
                .padding(.trailing)
            }
        }
        .background(Color("BgColor"))
//        .contentShape(Rectangle())
//      ,offset(x: offset)
        .offset(x: steps[index].offset)
        .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
    }
    }
    
    
//delete funcs
    func onChanged(value: DragGesture.Value){
        if value.translation.width < 0 {
//            if isSwiped{
            if steps[index].isSwiped{
//                offset = value.translation.width - 90
                steps[index].offset = value.translation.width - 90
            } else {
                steps[index].offset = value.translation.width
            }
        }
    }
    func onEnd(value: DragGesture.Value){
        
        withAnimation(.easeOut){
        if value.translation.width < 0 {
//            if -value.translation.width > UIScreen.main.bounds.width / 2 {
//                offset = -1000
//            }
            if -steps[index].offset > 50 {
                steps[index].isSwiped = true
                steps[index].offset = -90
            } else {
                steps[index].isSwiped = false
                steps[index].offset = 0
            }
            } else {
                steps[index].isSwiped = false
                steps[index].offset = 0
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
