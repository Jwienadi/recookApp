//
//  cookView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 09/05/22.
//

import SwiftUI
import UIKit
import Lottie
struct cookView: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var recipe: Recipe
    @State private var selectedPage = 0
    init(recipe: Recipe){
        self.recipe = recipe
        UIApplication.shared.isIdleTimerDisabled = true
    }
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    TabView(selection: $selectedPage ){
                        cookChecklistView(ing: recipe.ingredientArray, title: recipe.wTitle).tag(0)
                        ForEach(0..<recipe.stepArray.count, id:\.self){ i in
                            cookStepView(step: recipe.stepArray[i], curStep: i+1, totStep: recipe.stepArray.count).tag(i+1)
                        }
                        cookEndView().tag(recipe.stepArray.count + 1)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .always))
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                    Text("Swipe to proceed")
                        .font(.callout)
                        .foregroundColor(.secondary)
                }
                .navigationTitle("Cook")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    Button("Close"){
                        UIApplication.shared.isIdleTimerDisabled = false
                        self.presentation.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

//struct cookView_Previews: PreviewProvider {
//    static var previews: some View {
//        cookView()
//    }
//}
