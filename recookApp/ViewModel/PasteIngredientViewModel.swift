//
//  PasteIngredientViewModel.swift
//  recookApp
//
//  Created by Jessica Wienadi on 29/04/22.
//

import Foundation

extension Array {
    func ref(_ i:Int) -> Element? {
        return 0 <= i && i < count ? self[i] : nil
    }
}

extension PasteViewIngredient{
    func stringToIngredientsArr(IngString: String) -> [HIngredient]?{
        let IngArrFull = IngString.components(separatedBy: "\n")
        var IngArrSplit: [HIngredient] = []
        var res: HIngredient? =  nil
        if IngArrFull[0] != IngString {
        IngArrFull.forEach {ing in
            res = ingredientSpliiter(Ing: ing)
            //res kosong whyy
            IngArrSplit.append(res!)
        }
        }
        return IngArrSplit
        
    }
    
    func ingredientSpliiter(Ing: String) -> HIngredient{
        var amount = 0
        var unit = ""
        //            var name = ""
        //       let units = ["pcs", "mg", "kg", "gram", "mL", "L", "tbsp", "tsp", "ounce", "cup", "quart", "pint", "gallon", "pound", "fl. oz."]
        let units = ["kg","kilogram","kilograms", "kilogramme","cup","cups", "gram", "gr", "grams", "g", "gramme", "tbsp","tablespoon", "tablespoons", "tbsp.", "tbs", "tbs.", "tsp","teaspoon", "teaspoons", "tsp.", "t", "L","liter", "litre", "l", "mL", "milliliter", "milliliters", "cc", "millilitre", "millilitres", "lb", "pound", "lbs", "ounce", "ounces", "oz", "mg", "milligrams", "milligram", "milligrame","miligram", "fl. oz.", "fluid ounce", "fl oz"]
        
            //pcs belom
        // masih case sensitive
        
        var amountUnit = ""
        var cleanIng = Ing.trimmingCharacters(in: .whitespacesAndNewlines)
        let array = cleanIng.components(separatedBy: " ")
        if let _amount = array.ref(0) {
            amount = Int(_amount) ?? 0
            if (Int(_amount) != nil) {
                amountUnit += _amount
            }
        }
        
        if let _unit = array.ref(1),
           units.contains(_unit){
            unit = unitValidate(input: _unit)
            amountUnit += " "
            amountUnit += unit
        }
        amountUnit = amountUnit.trimmingCharacters(in: .whitespaces)
        
        if let range = cleanIng.range(of: amountUnit) {
            cleanIng.removeSubrange(range)
        }
        print("amount", amount)
        print("unit", unit)
        
        
        
        return HIngredient(qty: String(amount), unit: unit, name: cleanIng, offset: 0, isSwiped: false)
        
    }
    
    func unitValidate(input: String) -> String{
        //    let kgopt = ["kilogram","kilograms", "kg", "kilogramme"]
        //    let cupopt = ["cup","cups"]
        //    let gramopt = ["g", "gr", "grams", "gram", "gramme"]
        //    let tbspopt = ["tablespoon", "tablespoons", "tbsp", "tbsp.", "tbs", "tbs."]
        //    let tspopt = ["teaspoon", "teaspoons", "tsp.", "t"]
        //    let lopt = ["liter", "litre", "l"]
        //    let mlopt = ["ml", "milliliter", "milliliters", "cc", "millilitre", "millilitres"]
        //    let poundopt = ["pound", "lb", "lbs"]
        //    let ounceopt = ["ounce", "ounces", "oz"]
        //    let mgopt = ["miligram", "milligrams", "mg", "milligrame"]
        let unitsArray = [["kg","kilogram","kilograms", "kilogramme"],
                          ["cup","cups"],
                          ["gram", "gr", "grams", "g", "gramme"],
                          ["tbsp","tablespoon", "tablespoons", "tbsp.", "tbs", "tbs.","sdm","sdt.","sendok makan"],
                          ["tsp","teaspoon", "teaspoons", "tsp.", "t", "sdt", "sdt.", "sendok teh"],
                          ["L","liter", "litre", "l"],
                          ["mL", "milliliter", "milliliters", "cc", "millilitre", "millilitres"],
                          ["lb", "pound", "lbs"],
                          ["ounce", "ounces", "oz"],
                          ["mg", "milligrams", "milligram", "milligrame","miligram"],
                          ["fl. oz.", "fluid ounce", "fl oz"]]
        //pcs lupa
        var result = ""
    outerloop: for units in unitsArray {
        //units = array @ unitArray
        for unit in units {
            //unit == string @ units
            
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
