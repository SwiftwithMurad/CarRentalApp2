//
//  CategoryList+CoreDataProperties.swift
//  CarRentalApp2
//
//  Created by Mac on 27.12.24.
//
//

import Foundation
import CoreData


extension CategoryList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryList> {
        return NSFetchRequest<CategoryList>(entityName: "CategoryList")
    }

    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var size: String?

}

extension CategoryList : Identifiable {

}
