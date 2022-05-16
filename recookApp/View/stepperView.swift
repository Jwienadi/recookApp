//
//  stepperView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 10/05/22.
//

import SwiftUI
import StepperView

struct stepperView: View {
    
    //wajib pake steps

    let steps = [ Text("Cart").font(.caption),
                  Text("Delivery Address").font(.caption),
                  Text("Order Summary").font(.caption),
                  Text("Payment Method").font(.caption),
                  Text("Track").font(.caption)]

    let indicationTypes = [StepperIndicationType.custom(NumberedCircleView(text: "1")),
                            .custom(NumberedCircleView(text: "2")),
                            .custom(NumberedCircleView(text: "3")),
                            .custom(NumberedCircleView(text: "4")),
                            .custom(NumberedCircleView(text: "5"))]
                            
    var body: some View {
        StepperView()
            .addSteps(steps)
            .indicators(indicationTypes)
            .stepIndicatorMode(StepperMode.vertical)
            .spacing(30)
            .lineOptions(StepperLineOptions.custom(1, Colors.blue(.teal).rawValue))
    }
}

struct stepperView_Previews: PreviewProvider {
    static var previews: some View {
        stepperView()
    }
}
