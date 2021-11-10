//
//  UIViewController+Extension.swift
//  MintynApp
//
//  Created by Emmanuel Omokagbo on 09/11/2021.
//

import UIKit

extension UIViewController {
    
    public func showDefaultAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    public func setupNavbar() {
        self.navigationController?.navigationBar.tintColor = .systemGray2
//        self.navigationController?.navigationBar.topItem?.title = " "
//        self.navigationController?.navigationBar.isTranslucent = true
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        self.navigationController?.navigationBar.standardAppearance = appearance
    }
    
}
