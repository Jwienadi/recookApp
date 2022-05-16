//
//  Recipe+CoreDataProperties.swift
//  recookApp
//
//  Created by Jessica Wienadi on 31/03/22.
//
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var category: String?
    @NSManaged public var cook_time: Int64
    @NSManaged public var image: Data?
    @NSManaged public var note: String?
    @NSManaged public var prep_time: Int64
    @NSManaged public var source: String?
    @NSManaged public var title: String?
    @NSManaged public var yield: Int64
    @NSManaged public var ingredients: NSSet?
    @NSManaged public var steps: NSSet?
    @NSManaged public var time_added: Date
    
    public var wTitle: String {
        title ?? "Unknown Title"
    }
    public var wSource: String {
        source ?? "Unknown Source"
    }
    public var wNote: String {
        note ?? "No Note"
    }
    public var wCategory: String {
        category ?? "No Category"
    }
    
    public var prepString: String {
        timeToString(time: prep_time)
    }
    public var cookString: String {
        timeToString(time: cook_time)
    }
    
    public var prepcookString: String {
        timeToString(time: prep_time+cook_time)
    }
    
    func timeToString(time: Int64) -> String {
        let hour = time / 60
        let min = time % 60
        if hour == 0 {
            if min == 0{
                // -
                return "-"
            } else {
                // x min
                return "\(min) Min"
            }
        } else {
            if min == 0 {
                // x h
                return"\(hour) H"
            } else {
                // x h x min
                return "\(hour) H \(min) Min"
            }
        }
    }
    
    
//    public var wImage: Data {
//        guard let img = UIImage(named: "default") else { return }
//        let data = img.jpegData(compressionQuality: 1)
//        image ?? data
//    }
    
    
    public var ingredientArray: [Ingredient] {
        let set = ingredients as? Set<Ingredient> ?? []
        return set.sorted {
            $0.order < $1.order
        }
    }
    
    public var stepArray: [Step] {
        let set = steps as? Set<Step> ?? []
        return set.sorted {
            $0.order < $1.order
        }
    }

}

// MARK: Generated accessors for ingredients
extension Recipe {

    @objc(addIngredientsObject:)
    @NSManaged public func addToIngredients(_ value: Ingredient)

    @objc(removeIngredientsObject:)
    @NSManaged public func removeFromIngredients(_ value: Ingredient)

    @objc(addIngredients:)
    @NSManaged public func addToIngredients(_ values: NSSet)

    @objc(removeIngredients:)
    @NSManaged public func removeFromIngredients(_ values: NSSet)

}

// MARK: Generated accessors for steps
extension Recipe {

    @objc(addStepsObject:)
    @NSManaged public func addToSteps(_ value: Step)

    @objc(removeStepsObject:)
    @NSManaged public func removeFromSteps(_ value: Step)

    @objc(addSteps:)
    @NSManaged public func addToSteps(_ values: NSSet)

    @objc(removeSteps:)
    @NSManaged public func removeFromSteps(_ values: NSSet)

}

extension Recipe : Identifiable {

}
