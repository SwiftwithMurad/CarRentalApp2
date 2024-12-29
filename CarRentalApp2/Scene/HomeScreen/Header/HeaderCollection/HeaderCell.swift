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
        
    }
    
    func configCell(category: CategoryList, configView: ((UIView) -> Void)) {
        carImage.image = UIImage(named: category.image ?? "")
        categoryName.text = category.name
        categorySize.text = category.size
        configView(categoryView)
    }
    
    func configView(completion: ((UIView) -> Void), category: CategoryList) {
        completion(categoryView)
        carImage.image = UIImage(named: category.image ?? "")
        categoryName.text = category.name
        categorySize.text = category.size
        categoryName.textColor = .white
        categorySize.textColor = .white
        
    }
}
