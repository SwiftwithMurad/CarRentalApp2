//
//  CarList+CoreDataProperties.swift
//  CarRentalApp2
//
//  Created by Mac on 27.12.24.
//
//

import Foundation
import CoreData


extension CarList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CarList> {
        return NSFetchRequest<CarList>(entityName: "CarList")
    }

    @NSManaged public var category: String?
    @NSManaged public var engine: String?
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var model: String?
    @NSManaged public var price: String?

}

extension CarList : Identifiable {

}
