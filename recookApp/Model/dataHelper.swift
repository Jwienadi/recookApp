//
//  ingredientHelper.swift
//  recookApp
//
//  Created by Jessica Wienadi on 01/04/22.
//

import SwiftUI


struct HIngredient: Identifiable {
    var id = UUID()
    var qty: String
    var unit: String
    var name: String
    var offset: CGFloat
    var isSwiped: Bool
//    var order: Int
}
struct HStep {
    var step_text: String = ""
    var hourDuration: String = ""
    var minuteDuration: String = ""
    var timerOn: Bool
//    var order: Int
}

