//
//  Ingredient+CoreDataProperties.swift
//  recookApp
//
//  Created by Jessica Wienadi on 31/03/22.
//
//

import Foundation
import CoreData


extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var name: String?
    @NSManaged public var qty: Double
    @NSManaged public var unit: String?
    @NSManaged public var order: Int64
    @NSManaged public var header: Recipe?
    
    public var wName: String {
        name ?? ""
    }
    
    public var wUnit: String {
        unit ?? ""
    }
    
    public var qtyString: String {
        
        if qty.truncatingRemainder(dividingBy: 1) == 0 {
            //int
            return String(Int(qty))
        } else {
            //double
            return String(format: "%.3f", qty)
        }
        
        
    }
    
   
    

}

extension Ingredient : Identifiable {

}
