//
//  cookView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 09/05/22.
//

import SwiftUI
import UIKit

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
        VStack{
            TabView(selection: $selectedPage ){
                cookChecklistView(ing: recipe.ingredientArray, title: recipe.wTitle).tag(0)
                //view checklist
//                ForEach
                ForEach(0..<recipe.stepArray.count, id:\.self){ i in
                    cookStepView(step: recipe.stepArray[i], curStep: i+1, totStep: recipe.stepArray.count).tag(i+1)
                    }
                }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            //(indexDisplayMode: .always )
//                HStack{
//                    Button(action: {
//                        if selectedPage > 0 {
//                            withAnimation { selectedPage -= 1 }
//                        }
//                    }) {
//                        Image(systemName: "chevron.backward.circle.fill")
//                            .font(.system(size: 17, weight: .semibold))
//                        Text("Prev Step")
//                            .font(.body.bold())
//                    }
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(Color.accentColor)
//                        .frame(height: (selectedPage != 0) ? nil : 0)
//                        .disabled((selectedPage != 0))
                    
//                    Spacer().frame(width: 50)
                    
//                    Button(action: {
//                                           if selectedPage < recipe.stepArray.count {
//                                               withAnimation { selectedPage += 1 }
//                                           }
//                                       }) {
//                                           Image(systemName: "chevron.backward.circle.fill")
//                                               .font(.system(size: 17, weight: .semibold))
//                                           Text("Prev Step")
//                                               .font(.body.bold())
//                                       }
//                                           .padding()
//                                           .foregroundColor(.white)
//                                           .background(Color.accentColor)
//                                           .frame(height: (recipe.stepArray.count != 0) ? nil : 0)
//                                           .disabled((recipe.stepArray.count != 0))
//                }
        }
            .navigationTitle("Cook")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                    Button("Done"){
                        //open pop up > mode memasak
                        UIApplication.shared.isIdleTimerDisabled = false
                        self.presentation.wrappedValue.dismiss()
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
