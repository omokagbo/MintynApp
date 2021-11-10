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
        let loginVC = DashboardTabBarController()
        
//        loginVC.loginBtnTapped = { [weak self] in
//            self?.presentDashboard()
//        }
        
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    private func presentDashboard() {
        let dashboardVC = DashboardTabBarController()
        navigationController.pushViewController(dashboardVC, animated: true)
    }
    
}
