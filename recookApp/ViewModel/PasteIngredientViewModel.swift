//
//  PasteIngredientViewModel.swift
//  recookApp
//
//  Created by Jessica Wienadi on 29/04/22.
//

import Foundation

extension Array {
    //klo smpe out of range, jd nil , ngga error
    func ref(_ i:Int) -> Element? {
        return 0 <= i && i < count ? self[i] : nil
    }
}

extension PasteViewIngredient{
    func stringToIngredientsArr(IngString: String) -> [HIngredient]?{
        let CleanIngString = IngString.trimmingCharacters(in: .whitespacesAndNewlines)
        let IngArrFull = CleanIngString.components(separatedBy: "\n")
        var IngArrSplit: [HIngredient] = []
        var res: HIngredient? =  nil
        //        if IngArrFull[0] != IngString {
        //cek empty input or 1 line only
        if (IngArrFull[0] != CleanIngString) || (IngArrFull[0] != "") {
            IngArrFull.forEach {ing in
                let cleanIng = ing.trimmingCharacters(in: .whitespacesAndNewlines)
                
                if cleanIng != "" {
                    res = ingredientSpliiter(Ing: cleanIng)
                    IngArrSplit.append(res!)
                    
                }
            }
        }
        return IngArrSplit
        
    }
    
    func ingredientSpliiter(Ing: String) -> HIngredient{
        var amount: Double = 0
        var amountString: String = ""
        var unit = ""
        //            var name = ""
        //       let units = ["pcs", "mg", "kg", "gram", "mL", "L", "tbsp", "tsp", "ounce", "cup", "quart", "pint", "gallon", "pound", "fl. oz."]
        let units = ["kg","kilogram","kilograms", "kilogramme", "cup","cups", "gram", "gr", "grams", "g", "gramme","tbsp","tablespoon", "tablespoons", "tbsp.", "tbs", "tbs.","sdm","sdt.","sendok makan","tsp","teaspoon", "teaspoons", "tsp.", "t", "sdt", "sdt.", "sendok teh", "l","liter", "litre", "l", "ml", "milliliter", "milliliters", "cc", "millilitre", "millilitres","mililiter", "mililitre", "mililiters", "mililitres","lb", "pound", "lbs","ounce", "ounces", "oz","mg", "milligrams", "milligram", "milligrame","miligram","fl. oz.", "fluid ounce", "fl oz","pcs"]
        
       
        
        var amountUnit = ""
        var userAmountUnit = ""
        var cleanIng = Ing.trimmingCharacters(in: .whitespacesAndNewlines)
        
       cleanIng = cleanIng.replacingOccurrences(of: "½", with: ".5")
//        cleanIng = cleanIng.replacingOccurrences(of: "1/2", with: ".5")
        cleanIng = cleanIng.replacingOccurrences(of: "¼", with: ".25")
        cleanIng = cleanIng.replacingOccurrences(of: "¾", with: ".75")
//        cleanIng = cleanIng.replacingOccurrences(of: ",", with: ".")
        
        //split num unit nama
        var array = cleanIng.components(separatedBy: " ")
        let qty = array[0]
        array[0] = array[0].replacingOccurrences(of: ",", with: ".")
        
        
        //cek arr(0) number gak, if yes
        if let _amount = array.ref(0) {
            
            //MARK: BERUBAH DI SINI , UPDATE BAB 4
            //bwt cek arr 0 is num or not
            amount = Double(_amount) ?? 0
//
            if (Double(_amount) != nil) {
                
                amountString = {
                    if amount.truncatingRemainder(dividingBy: 1) == 0 {
                        //int
                        return String(Int(amount))
                    } else {
                        //double
    //                    return String(format: "%f", amount)
                        return "\(amount)"
                    }
                }()
                //append number ke string if amount nya ngga nil
//                if amount.truncatingRemainder(dividingBy: 1) == 0 {
//                    //int
//                    amountUnit += _amount
//                    userAmountUnit += _amount
//                } else {
                    //double
                print(_amount)
                print(amount)
                print(amountString)
                    amountUnit += _amount
                    userAmountUnit += qty
//                }
                
              
            }
        }
        
        if let _unit = array.ref(1)?.lowercased(),
           //split ingredients, check arr(1) = unit ngga
           units.contains(_unit){
            
            userAmountUnit += " "
            userAmountUnit += _unit
            
            //cek unit yg ditulis masuk list ga, if yes, choose one dari picker
            unit = unitValidate(input: _unit)
            amountUnit += " "
            amountUnit += unit
            
           
        }
        amountUnit = amountUnit.trimmingCharacters(in: .whitespaces)
        userAmountUnit = userAmountUnit.trimmingCharacters(in: .whitespaces)
        
        if let range = cleanIng.lowercased().range(of: userAmountUnit.lowercased()) {
            cleanIng.removeSubrange(range)
            cleanIng = cleanIng.trimmingCharacters(in: .whitespaces)
        }
        print("amount", amount)
        print("unit", unit)
        print("nama", cleanIng)
        
        
        //MARK: BERUBAH DISINI
        return HIngredient(qty: amountString, unit: unit, name: cleanIng, offset: 0, isSwiped: false)
        
    }
    
    func unitValidate(input: String) -> String{
        let unitsArray = [["kg","kilogram","kilograms", "kilogramme"],
                          ["cup","cups"],
                          ["gram", "gr", "grams", "g", "gramme"],
                          ["tbsp","tablespoon", "tablespoons", "tbsp.", "tbs", "tbs.","sdm","sdt.","sendok makan"],
                          ["tsp","teaspoon", "teaspoons", "tsp.", "t", "sdt", "sdt.", "sendok teh"],
                          ["L","liter", "litre", "l"],
                          ["mL", "milliliter", "milliliters", "cc", "millilitre", "millilitres", "mililiter", "mililitre", "mililiters", "mililitres"],
                          ["lb", "pound", "lbs"],
                          ["ounce", "ounces", "oz"],
                          ["mg", "milligrams", "milligram", "milligrame","miligram"],
                          ["fl. oz.", "fluid ounce", "fl oz"],
                          ["pcs"]]
        //pcs lupa
        var result = ""
    outerloop: for units in unitsArray {
        //units = array @ unitArray
        for unit in units {
            //unit == string @ units
            print("\(input.lowercased()) == \(unit.lowercased())")
            //lowercased not working (ml lowercase)
            if input.lowercased() == unit.lowercased() {
                result = units[0]
                print(units[0])
                break outerloop
            }
        }
    }
        return result
    }
}
