//
//  PastePopUp.swift
//  recookApp
//
//  Created by Jessica Wienadi on 31/03/22.
//

import SwiftUI

struct Popup<T: View>: ViewModifier {
    let popup: T
    let isPresented: Bool

    let alignment: Alignment // (*)

        init(isPresented: Bool, alignment: Alignment, @ViewBuilder content: () -> T) { // (*)
            self.isPresented = isPresented
            self.alignment = alignment // (*)
            popup = content()
        }

    // 2.
    func body(content: Content) -> some View {
        content
            .overlay(popupContent())
    }

    // 3.
    @ViewBuilder private func popupContent() -> some View {
        GeometryReader { geometry in
            if isPresented {
                popup
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: alignment)
            }
        }
    }
}

struct Popup1_Previews: PreviewProvider {
    static var previews: some View {
        Color.clear
            .modifier(Popup(isPresented: true, alignment: .center, content: PasteViewIngredient.init))
            .previewDevice("iphone12")
    }
}
