//
//  hourMinuteTextFieldView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 13/04/22.
//

import SwiftUI

struct hourMinuteTextFieldView: View {
    @Binding var hour: String
    @Binding var minute: String
    var body: some View {
        HStack{
        IntField(intString: $hour)
            .padding(10)
            .background(.white)
            .cornerRadius(8)
        Text("Hour")
            .fixedSize()
        IntField(intString: $minute)
            .padding(10)
            .background(.white)
            .cornerRadius(8)
        Text("Minute")
            .fixedSize()
        }
    }
}

//struct hourMinuteTextFieldView_Previews: PreviewProvider {
//    static var previews: some View {
//        hourMinuteTextFieldView()
//    }
//}
