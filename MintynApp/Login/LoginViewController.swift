//
//  LoginViewController.swift
//  MintynApp
//
//  Created by Decagon on 09/11/2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var mintInsurance: UIImageView!
    
    @IBOutlet weak var openAccount: UIImageView!
    
    @IBOutlet weak var cacBusiness: UIImageView!
    
    @IBOutlet weak var contactSupport: UIImageView!
    
    @IBOutlet weak var loginView: UIView!
    
    // MARK:- ViewController Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.layer.cornerRadius = 30
        setupGesturesForImages()
    }
    
    // MARK: - Methods
    
    private func createTapGesture(action: Selector?, image: UIImageView) {
        let tap = UITapGestureRecognizer(target: self, action: action)
        image.addGestureRecognizer(tap)
    }
    
    private func setupGesturesForImages() {
        createTapGesture(action: #selector(presentMintInsurance), image: mintInsurance)
        createTapGesture(action: #selector(presentOpenAccount), image: openAccount)
        createTapGesture(action: #selector(presentCacBusiness), image: cacBusiness)
        createTapGesture(action: #selector(presentContactSupport), image: contactSupport)
    }

    @objc private func presentMintInsurance() {
        self.showDefaultAlert(title: "Mint Insurance", message: "Functionality Coming Soon")
    }
    
    @objc private func presentOpenAccount() {
        self.showDefaultAlert(title: "Open Account", message: "Functionality Coming Soon")
    }
    
    @objc private func presentCacBusiness() {
        self.showDefaultAlert(title: "CAC Business Registration", message: "Functionality Coming Soon")
    }
    
    @objc private func presentContactSupport() {
        self.showDefaultAlert(title: "Contact Support ", message: "Functionality Coming Soon")
    }
    
}
