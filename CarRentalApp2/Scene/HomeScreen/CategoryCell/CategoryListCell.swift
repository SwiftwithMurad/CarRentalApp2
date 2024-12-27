//
//  CategoryListCell.swift
//  CarRentalApp2
//
//  Created by Mac on 27.12.24.
//

import UIKit

class CategoryListCell: UICollectionViewCell {
    
    @IBOutlet private weak var carEngine: UILabel!
    @IBOutlet private weak var carModel: UILabel!
    @IBOutlet private weak var carPrice: UILabel!
    @IBOutlet private weak var carName: UILabel!
    @IBOutlet private weak var carImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    
        configUI()
    }
    
    func configUI() {
//        layer.backgroundColor = UIColor.white.cgColor
        layer.cornerRadius = 30
    }
    
    func configCell(car: CarList) {
        carName.text = car.name
        carModel.text = car.model
        carPrice.text = car.price
        carEngine.text = car.engine
        carImage.image = UIImage(named: car.image ?? "")
    }
}
