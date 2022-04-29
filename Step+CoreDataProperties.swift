//
//  Step+CoreDataProperties.swift
//  recookApp
//
//  Created by Jessica Wienadi on 31/03/22.
//
//

import Foundation
import CoreData


extension Step {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Step> {
        return NSFetchRequest<Step>(entityName: "Step")
    }

    @NSManaged public var duration: Int64
    @NSManaged public var step_text: String?
    @NSManaged public var order: Int64
    @NSManaged public var header: Recipe?

    public var wStep_text: String {
        step_text ?? ""
    }
}

extension Step : Identifiable {

}
