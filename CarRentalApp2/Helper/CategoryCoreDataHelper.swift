//
//  CategoryCoreDataHelper.swift
//  CarRentalApp2
//
//  Created by Mac on 27.12.24.
//

import Foundation

class CategoryCoreDataHelper {
    let context = AppDelegate().persistentContainer.viewContext
    var category = [CategoryList]()
    
    func fetchData(completion: (([CategoryList]) -> Void)) {
        do {
            category = try context.fetch(CategoryList.fetchRequest())
            print(category)
            completion(category)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveData(carCategory: CarCategory) {
        let newCategory = CategoryList(context: context)
        newCategory.image = carCategory.image
        newCategory.name = carCategory.name
        newCategory.size = carCategory.size
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
