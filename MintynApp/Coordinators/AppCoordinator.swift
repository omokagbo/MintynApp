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
        
        loginVC.loginBtnTapped = { [weak self] in
            self?.presentHome()
        }
        
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    private func presentHome() {
        let homeVC = HomeViewController()
        homeVC.modalPresentationStyle = .fullScreen
        navigationController.present(homeVC, animated: true)
    }
    
}
