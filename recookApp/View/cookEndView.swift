//
//  cookEndView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 23/05/22.
//

import SwiftUI
import Lottie

struct cookEndView: View {
    var body: some View {
        VStack{
        LottieView(name:"done", loopMode: .playOnce)
                .frame(width: 250, height: 250)
        Text("Cooking Done!")
                .font(.title.bold())
                .padding()
//                .foregroundColor(.ac)
                
        Text("Press Close to End Cooking")
                .font(.caption)
        Spacer()
        }
    }
}

struct cookEndView_Previews: PreviewProvider {
    static var previews: some View {
        cookEndView()
    }
}
