//
//  cookChecklistViewModel.swift
//  recookApp
//
//  Created by Jessica Wienadi on 10/05/22.
//

import Foundation

extension cookChecklistView {
    class cookChecklistViewModel: ObservableObject {
        
        @Published var ing: [ingChecklistData] = []
        
        init(data: [Ingredient]){
            for i in data{
                self.ing.append(ingChecklistData(ing: i))
            }
        }
        
    }
    
}

struct ingChecklistData {
    
    let ing: Ingredient
    
    var ingString: String {
        let qty = ing.qtyString
        let text = "\(qty) \(ing.wUnit) \(ing.wName)"
        return text
    }
    
    var isChecked: Bool = false
}
