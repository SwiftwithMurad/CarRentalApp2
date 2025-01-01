//
//  HeaderCell.swift
//  CarRentalApp2
//
//  Created by Mac on 27.12.24.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    
    @IBOutlet private weak var categoryView: UIView!
    @IBOutlet private weak var categorySize: UILabel!
    @IBOutlet private weak var categoryName: UILabel!
    @IBOutlet private weak var carImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryView.layer.cornerRadius = 30
    }
    
    func configCell(category: CategoryList) {
        carImage.image = UIImage(named: category.image ?? "")
        categoryName.text = category.name
        categorySize.text = category.size
//        category.isSelected = false
        updateView(isSelected: category.isSelected)
    }
    
    func updateView(isSelected: Bool) {
        categoryView?.backgroundColor = isSelected ? .systemBlue: .white
        categoryName.textColor = isSelected ? .white: .black
        categorySize.textColor = isSelected ? .white: .lightGray
    }
}
