//
//  LoginController.swift
//  CarRentalApp2
//
//  Created by Mac on 27.12.24.
//

import UIKit

class LoginController: UIViewController {
    let loginViewModel = LoginViewModel()
    let manager = UserDefaultsManager()

    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    func configUI() {
        nameField.layer.borderWidth = 1
        nameField.layer.cornerRadius = 30
        nameField.layer.masksToBounds = true
        passwordField.layer.borderWidth = 1
        passwordField.layer.cornerRadius = 30
        passwordField.layer.masksToBounds = true
        passwordField.isSecureTextEntry = true
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        if let name = nameField.text, !name.isEmpty,
           let password = passwordField.text, !password.isEmpty,
           let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let sceneDelegate = windowScene.delegate as! SceneDelegate
            manager.setValue(value: true, key: .isLoggedIn)
            sceneDelegate.homeRoot()
            
        }
    }
}
