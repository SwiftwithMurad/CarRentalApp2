//
//  Cars.swift
//  CarRentalApp2
//
//  Created by Mac on 27.12.24.
//

import Foundation

class CarData {
    let carHelper = CarCoreDataHelper()
    let categoryHelper = CategoryCoreDataHelper()
    
    func saveData() {
        //save category
        let category1 = CarCategory(name: "Standard", image: "car_1", size: "4")
        categoryHelper.saveData(carCategory: category1)
        let category2 = CarCategory(name: "Prestige", image: "car_2", size: "5")
        categoryHelper.saveData(carCategory: category2)
        let category3 = CarCategory(name: "SUV", image: "car_3", size: "4")
        categoryHelper.saveData(carCategory: category3)
        let category4 = CarCategory(name: "Comfort", image: "car_4", size: "5")
        categoryHelper.saveData(carCategory: category4)
    }
}
