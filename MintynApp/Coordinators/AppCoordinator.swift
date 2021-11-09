//
//  AppCoordinator.swift
//  MintynApp
//
//  Created by Emmanuel Omokagbo on 09/11/2021.
//

import UIKit

class AppCoordinator {
    
    private let navigationController = UINavigationController()
    
    var rootViewController: UIViewController  {
        return navigationController
    }
    
    func start() {
        presentLogin()
    }
    
    private func presentLogin() {
        let loginVC = LoginViewController()
        navigationController.pushViewController(loginVC, animated: true)
    }
    
}
