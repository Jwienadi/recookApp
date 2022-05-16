//
//  cookChecklistView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 10/05/22.
//

import SwiftUI

struct cookChecklistView: View {
    
    @ObservedObject private var viewModel: cookChecklistViewModel
    let title : String
    
    init(ing: [Ingredient], title: String){
        self.viewModel = cookChecklistViewModel(data: ing)
        self.title = title
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .padding()
                .font(.title.bold())
                .frame(minWidth: 0, maxWidth: .infinity)
//                .frame(width: .infinity, alignment: .center)
            
            Text("Prepare your ingredients:")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .center)
            List{
            ForEach(0..<viewModel.ing.count, id: \.self) { i in
              HStack {
                  Image(systemName: viewModel.ing[i].isChecked ? "checkmark.square.fill" : "square")
                              .font(.system(size: 30))
                              .foregroundColor(viewModel.ing[i].isChecked ? Color(UIColor.systemBlue) : Color.secondary)
                              .onTapGesture {
                                  viewModel.ing[i].isChecked.toggle()
                              }
                  Text(viewModel.ing[i].ingString)
                      .font(.title3)
                  Spacer()
              }
            
            
            
            }
        }
        }
        
    }
}

//struct cookChecklistView_Previews: PreviewProvider {
//    static var previews: some View {
//        cookChecklistView()
//    }
//}
