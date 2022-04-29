//
//  DetailRecipeViewComponents.swift
//  recookApp
//
//  Created by Jessica Wienadi on 01/04/22.
//

import Foundation
import SwiftUI

struct DetailInfoView: View {
    let infoTitle: String
    let infoText: LocalizedStringKey
    var body: some View {
        VStack(alignment: .center){
            Text(infoTitle)
                .font(.footnote)
                .foregroundColor(.secondary)
            Text(infoText)
                .font(.callout)
                .foregroundColor(.black)
        }
    }
    
}
