//
//  CarCoreDataHelper.swift
//  CarRentalApp2
//
//  Created by Mac on 27.12.24.
//

import Foundation

class CarCoreDataHelper {
    let context = AppDelegate().persistentContainer.viewContext
    var cars = [CarList]()

    func fetchData(completion: (([CarList]) -> Void)) {
        do {
            cars = try context.fetch(CarList.fetchRequest())
            print(cars)
            completion(cars)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveData(car: Car) {
        let newCar = CarList(context: context)
        newCar.name = car.name
        newCar.price = car.price
        newCar.image = car.image
        newCar.model = car.model
        newCar.engine = car.engine
        newCar.category = car.category?.name
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
