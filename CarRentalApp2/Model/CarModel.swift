//
//  CarModel.swift
//  CarRentalApp2
//
//  Created by Mac on 27.12.24.
//

import Foundation

struct Car {
    let name: String?
    let model: String?
    let image: String?
    let engine: String?
    let price: String?
    let category: CarCategory?
}

struct CarCategory {
    let name: String?
    let image: String?
    let size: String?
    let isSelected: Bool?
}
