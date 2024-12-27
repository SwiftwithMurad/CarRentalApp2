//
//  SearchController.swift
//  CarRentalApp2
//
//  Created by Mac on 27.12.24.
//

import UIKit

class SearchController: UIViewController {
    let carHelper = CarCoreDataHelper()
    var cars = [CarList]()
    
    @IBOutlet weak var searchCollection: UICollectionView!
    @IBOutlet weak var searchFieldText: UITextField!
    @IBOutlet private weak var searchFieldView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    func configUI() {
        title = "Search"
        searchFieldView.layer.cornerRadius = 30
        searchCollection.register(UINib(nibName: "CategoryListCell", bundle: nil), forCellWithReuseIdentifier: "CategoryListCell")
        searchCollection.delegate = self
        searchCollection.dataSource = self
        carHelper.fetchData { carList in
            cars = carList
        }
    }
    
    

    @IBAction func searchField(_ sender: Any) {
        
    }
}

extension SearchController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryListCell", for: indexPath) as! CategoryListCell
        cell.configCell(car: cars[indexPath.row])
        cell.backgroundColor = UIColor.white
        return cell
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.size.width - 60, height: 300)
    }
}
