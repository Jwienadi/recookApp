//
//  PasteStepViewModel.swift
//  recookApp
//
//  Created by Jessica Wienadi on 13/05/22.
//


import Foundation


extension PasteViewStep{
    func stringToStepsArr(StepString: String) -> [HStep]?{
        let CleanStepString = StepString.trimmingCharacters(in: .whitespacesAndNewlines)
        let StepArrFull = CleanStepString.components(separatedBy: "\n")
        var StepArrSplit: [HStep] = []
        var res: HStep? =  nil
        //        if StepArrFull[0] != StepString {
        if (StepArrFull[0] != CleanStepString) || (StepArrFull[0] != "") {
            StepArrFull.forEach {step in
                let cleanStep = step.trimmingCharacters(in: .whitespacesAndNewlines)
                if cleanStep != "" {
                    res = HStep(step_text: step, hourDuration: "", minuteDuration: "", timerOn: false, offset: 0, isSwiped: false)
                    StepArrSplit.append(res!)
                }
            }
        }
        return StepArrSplit
        
    }
    
    
    
    
}
