//
//  cookStepView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 10/05/22.
//

import SwiftUI
struct cookStepView: View {
    let step: Step
    let curStep: Int
    let totStep: Int
    var body: some View {
        ZStack{
            VStack(alignment: .center, spacing: 15){
                Text("step \(curStep) out of \(totStep)")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.secondary)
                if step.duration != 0{
                    timerView(viewModel: timerViewModel(timeMin: Int(step.duration)))
                        .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.bottom]})
                }
                Spacer()
            }
            VStack(alignment: .center){
                Text(step.wStep_text)
                    .font(.title)
                    .padding(5)
                    .frame(maxHeight: 150)
                    .minimumScaleFactor(0.1)
            }
        }
    }
}

//struct cookStepView_Previews: PreviewProvider {
//    static var previews: some View {
//        cookStepView()
//    }
//}
