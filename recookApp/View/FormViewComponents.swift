//
//  ViewComponents.swift
//  recookApp
//
//  Created by Jessica Wienadi on 29/03/22.
//

import SwiftUI
import Combine

struct IntField: View {
    @Binding var intString: String
    var body: some View {
        return TextField("0", text: $intString)
        .keyboardType(.numberPad)
        .frame(width: 40)
        .multilineTextAlignment(. center)
        .onReceive(Just(intString)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.intString = filtered
                        }}
//        .onAppear(perform: {
//            intString = "\(int)"
//        })
    }
}
struct DoubleField: View {
    @Binding var doubleString: String
    var body: some View {
        return TextField("0", text: $doubleString)
        .keyboardType(.decimalPad)
        .frame(width: 50)
        .multilineTextAlignment(. center)
        .onReceive(Just(doubleString)) { newValue in
                        let filter1 = newValue.filter { "0123456789.,".contains($0) }
                        let filter2 = String(filter1.map {$0 == "," ? "." : $0 })
                        if filter2 != newValue {
                            self.doubleString = filter2
                        }}
//        .onAppear(perform: {
//            intString = "\(int)"
//        })
    }
}


struct StringInputForm: View {
    @Binding var data: String
    let inputName: String
    let placeholder: String
    var body: some View {
        HStack{
            Text(inputName)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
                .padding(.leading)
                
            TextField(placeholder, text: $data)
                .disableAutocorrection(true)
                .textInputAutocapitalization(.never)
        }
        .padding(10)
        .background(.white)
        .cornerRadius(8)
        .frame(maxHeight: .infinity)
    }
}

class TextLimiter: ObservableObject {
    private let limit: Int
    
    init(limit: Int) {
        self.limit = limit
    }
    @Published var valueInt = 0
    @Published var value = "" {
        didSet {
            if value.count > self.limit {
                //potong kelebihannya
                value = String(value.prefix(self.limit))
                valueInt = Int(value.prefix(self.limit))!
                self.hasReachedLimit = true
            } else {
                self.hasReachedLimit = false
            }
        }
    }
    @Published var hasReachedLimit = false
}
