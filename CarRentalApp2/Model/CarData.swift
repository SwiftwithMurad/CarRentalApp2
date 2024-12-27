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
    let manager = UserDefaultsManager()
    
    func saveData() {
        manager.setValue(value: true, key: .isSaved)
        //save category
        let category1 = CarCategory(name: "Standard", image: "car_1", size: "4")
        categoryHelper.saveData(carCategory: category1)
        let category2 = CarCategory(name: "Prestige", image: "car_2", size: "5")
        categoryHelper.saveData(carCategory: category2)
        let category3 = CarCategory(name: "SUV", image: "car_3", size: "4")
        categoryHelper.saveData(carCategory: category3)
        let category4 = CarCategory(name: "Comfort", image: "car_4", size: "5")
        categoryHelper.saveData(carCategory: category4)
        
        //save car
        let car1 = Car(name: "KIA", model: "Stinger", image: "stinger", engine: "6-Cyl 2.5 Liter", price: "$25000", category: category1)
        carHelper.saveData(car: car1)
        let car2 = Car(name: "Mercedes", model: "C-class", image: "car_2", engine: "6-Cyl 3.0 Liter", price: "$30000", category: category2)
        carHelper.saveData(car: car2)
        let car3 = Car(name: "Jeep", model: "GrandCheeroke", image: "jeep", engine: "8-Cyl 6.2 Liter", price: "$70000", category: category3)
        carHelper.saveData(car: car3)
        let car4 = Car(name: "Toyota", model: "Yaris İA", image: "car_4", engine: "4-Cyl 1.5 Liter", price: "$10000", category: category4)
        carHelper.saveData(car: car4)
    }
}
