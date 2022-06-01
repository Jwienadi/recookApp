//
//  PasteView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 31/03/22.
//

import SwiftUI

struct PasteViewIngredient: View {
    @State private var pasteText = ""
    @Binding var isPresented: Bool
    @Binding var ingredients: [HIngredient]
    var body: some View {
        VStack(spacing: 0){
            CustomTextEditor.init(placeholder: "Paste ingredients here!\none ingredient/line \nExample: \n1 kg cake flour \n150 ml milk \n1 pcs apple ", text: $pasteText)
                .frame(maxWidth: .infinity, maxHeight: 200)
            Button("Add"){
                let a = stringToIngredientsArr(IngString: pasteText)
                if a != nil {
                    ingredients.append(contentsOf: a!)
                }
                self.isPresented = false
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(.white)
        }
        .padding()
        .background(.quaternary)
        .frame(width: 350)
        .cornerRadius(10)
    }
}
    
    

//extension PasteView {
//    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
//        clipShape( RoundedCorner(radius: radius, corners: corners) )
//    }
//
//    struct RoundedCorner: Shape {
//
//        var radius: CGFloat = .infinity
//        var corners: UIRectCorner = .allCorners
//
//        func path(in rect: CGRect) -> Path {
//            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//            return Path(path.cgPath)
//        }
//    }
//}
            
struct CustomTextEditor: View {
   let placeholder: String
   @Binding var text: String
   let internalPadding: CGFloat = 5
   var body: some View {
      ZStack(alignment: .topLeading) {
         TextEditor(text: $text)
//          .padding(internalPadding)
          .disableAutocorrection(true)
          .textInputAutocapitalization(.never)
          
          if text.isEmpty {   ///show placeholder if not text typed
            Text(placeholder)
              .foregroundColor(Color.primary.opacity(0.25))
              .padding(EdgeInsets(top: 7, leading: 4, bottom: 0, trailing: 0))
              .padding(internalPadding)
          }
       }.onAppear() {
           UITextView.appearance().backgroundColor = .white
         }.onDisappear() {
           UITextView.appearance().backgroundColor = nil
         }
       
    }
}

//struct PasteViewIngredient_Previews: PreviewProvider {
//    static var previews: some View {
//        PasteViewIngredient(isPresented: true, addedIng: <#Binding<[HIngredient]>#>)
////            .previewLayout(.sizeThatFits)
//            
//    }
//}
