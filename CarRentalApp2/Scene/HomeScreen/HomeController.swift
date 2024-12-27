//
//  HomeController.swift
//  CarRentalApp2
//
//  Created by Mac on 27.12.24.
//

import UIKit

class HomeController: UIViewController {
    let homeViewModel = HomeViewModel()
    let carHelper = CarCoreDataHelper()
    let data = CarData()
    var cars = [CarList]()
    let manager = UserDefaultsManager()
    var existedCars = [CarList]()
    var searchedCars = [CarList]()
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet private weak var categoryListCollection: UICollectionView!
    @IBOutlet private weak var searchTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    func configUI() {
        title = "Car Rental"
        searchView.layer.cornerRadius = 30
        categoryListCollection.delegate = self
        categoryListCollection.dataSource = self
        categoryListCollection.register(UINib(nibName: "CategoryListCell", bundle: nil), forCellWithReuseIdentifier: "CategoryListCell")
        categoryListCollection.register(UINib(nibName: "\(HeaderCollectionReusableView.self)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(HeaderCollectionReusableView.self)")
        if !manager.getBool(key: .isSaved) {
            data.saveData()
        }
        carHelper.fetchData { carList in
            cars = carList
        }
    }
    
    
    @IBAction func searchField(_ sender: Any) {
        if let search = searchTextField.text?.isEmpty {
            existedCars = cars
            categoryListCollection.reloadData()
        } else if cars.contains(where: { $0.name == searchTextField.text }) {
            searchedCars = cars
            categoryListCollection.reloadData()
        }
    }
}


extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(HeaderCollectionReusableView.self)", for: indexPath) as! HeaderCollectionReusableView
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 200)
    }
}
