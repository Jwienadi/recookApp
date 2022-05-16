//
//  PasteStepViewModel.swift
//  recookApp
//
//  Created by Jessica Wienadi on 13/05/22.
//


import Foundation


extension PasteViewStep{
    func stringToStepsArr(StepString: String) -> [HStep]?{
        let StepArrFull = StepString.components(separatedBy: "\n")
        var StepArrSplit: [HStep] = []
        var res: HStep? =  nil
        if StepArrFull[0] != StepString {
        StepArrFull.forEach {step in
            res = HStep(step_text: step, hourDuration: "", minuteDuration: "", timerOn: false)
            //res kosong whyy
            StepArrSplit.append(res!)
        }
        }
        return StepArrSplit
        
    }
    
    
    
    
}
