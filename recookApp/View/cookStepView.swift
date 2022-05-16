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
    
//    init(data: Step){
//        self.step = data
//    }
    
    var body: some View {
        GeometryReader { bounds in
        VStack(alignment: .center, spacing: 10){
            Spacer()
            Text("step \(curStep) out of \(totStep)")
                .font(.headline)
                .padding()
                .foregroundColor(.secondary)
                .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.bottom]})
//                .position(x: bounds.size.width / 2)
                            }
            Spacer()
            if step.duration != 0{
                timerView(viewModel: timerViewModel(timeMin: Int(step.duration)))
                        .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.bottom]})
//                        .position(x: bounds.size.width / 2)
//                    .frame(maxHeight: .infinity)
            }
            Spacer()
            
            Text(step.wStep_text)
                .font(.title)
                .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.bottom] })
//                .position(x: bounds.size.width / 2, y: bounds.size.height / 2)
//                .frame(maxHeight: .infinity)
//                .alignment
            Spacer()

          
        }
        
    }
}
//}

//struct cookStepView_Previews: PreviewProvider {
//    static var previews: some View {
//        cookStepView()
//    }
//}
