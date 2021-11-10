//
//  DashboardTabBarController.swift
//  MintynApp
//
//  Created by Emmanuel Omokagbo on 09/11/2021.
//

import UIKit

class DashboardTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        delegate = self
        setupTabBar()
        setupNavbar()
    }
   
    fileprivate func setupTabBar() {
        let firstTabBar = HomeViewController()
        let secondTabBar = FinancesViewController()
        let thirdTabBar = CardsViewController()
        let fourthTabBar = SettingsViewController()
        let fifthTabBar = SupportViewController()
        
        firstTabBar.navigationItem.largeTitleDisplayMode = .never
        secondTabBar.navigationItem.largeTitleDisplayMode = .never
        thirdTabBar.navigationItem.largeTitleDisplayMode = .never
        fourthTabBar.navigationItem.largeTitleDisplayMode = .never
        fifthTabBar.navigationItem.largeTitleDisplayMode = .never
        
        
        let firstNavBar = UINavigationController(rootViewController: firstTabBar)
        let secondNavBar = UINavigationController(rootViewController: secondTabBar)
        let thirdNavBar = UINavigationController(rootViewController: thirdTabBar)
        let fourthNavBar = UINavigationController(rootViewController: fourthTabBar)
        let fifthNavBar = UINavigationController(rootViewController: fifthTabBar)
        
        firstNavBar.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), tag: 1)
        secondNavBar.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "building.columns.fill"), tag: 2)
        thirdNavBar.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "creditcard.fill"), tag: 3)
        fourthNavBar.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "gearshape.fill"), tag: 4)
        fifthNavBar.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "headphones.circle"), tag: 5)
        
        
        firstNavBar.navigationBar.prefersLargeTitles = false
        secondNavBar.navigationBar.prefersLargeTitles = false
        thirdNavBar.navigationBar.prefersLargeTitles = false
        fourthNavBar.navigationBar.prefersLargeTitles = false
        fifthNavBar.navigationBar.prefersLargeTitles = false
        
        setViewControllers([firstNavBar, secondNavBar, thirdNavBar, fourthNavBar, fifthNavBar], animated: true)
        tabBar.backgroundColor = .systemBackground
        tabBar.alpha = 0.9
        tabBar.isTranslucent = true
        tabBar.tintColor = UIColor(red: 148/255, green: 110/255, blue: 43/255, alpha: 1)
    }
    
}

