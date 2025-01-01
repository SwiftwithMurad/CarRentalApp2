//
//  HeaderCollectionReusableView.swift
//  CarRentalApp2
//
//  Created by Mac on 27.12.24.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    var category = [CategoryList]()
    var sendCollection: ((String) -> Void)?
//    var send: ((UICollectionView) -> Void)?
    
    @IBOutlet private weak var headerCollection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configUI()
    }
    
    func configUI() {
        headerCollection.delegate = self
        headerCollection.dataSource = self
        headerCollection.register(UINib(nibName: "\(HeaderCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(HeaderCell.self)")
    }
    
    func configCategory(category: [CategoryList]) {
        self.category = category
    }
}

extension HeaderCollectionReusableView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HeaderCell.self)", for: indexPath) as! HeaderCell
        cell.configCell(category: category[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: headerCollection.frame.size.width / 2.8 , height: 155)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for (index, _) in category.enumerated() {
            category[index].isSelected = index == indexPath.item ? true : false
        }
        sendCollection?(category[indexPath.row].name ?? "")
        headerCollection.reloadData()
    }
}
