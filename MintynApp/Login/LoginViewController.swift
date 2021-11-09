//
//  LoginViewController.swift
//  MintynApp
//
//  Created by Emmanuel Omokagbo on 09/11/2021.
//

import UIKit
import FlagPhoneNumber


class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var mintInsurance: UIImageView!
    
    @IBOutlet weak var openAccount: UIImageView!
    
    @IBOutlet weak var cacBusiness: UIImageView!
    
    @IBOutlet weak var contactSupport: UIImageView!
    
    @IBOutlet weak var loginView: UIView!
    
    @IBOutlet weak var phoneNumberField: FPNTextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    // MARK: - Properties
    
    private let passwordBtn: UIButton = {
        let passwordBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        passwordBtn.setImage(UIImage(systemName: "eye"), for: .normal)
        passwordBtn.tintColor = .systemGray
        passwordBtn.addTarget(self, action: #selector(didTapHidePassword), for: .touchUpInside)
        return passwordBtn
    }()
    
    private var passwordIsHidden = true
    
    // MARK: - ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.layer.cornerRadius = 30
        setupGesturesForImages()
        setupNavbar()
        customisePhoneNumberField()
        passwordField.rightView = passwordBtn
        passwordField.rightViewMode = .always
    }
    
    // MARK: - Methods
    
    private func customisePhoneNumberField() {
        phoneNumberField.delegate = self
        phoneNumberField.setFlag(key: .NG)
        phoneNumberField.placeholder = "802 123 4567"
    }
    
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
    
    @objc func didTapHidePassword() {
        passwordIsHidden = !passwordIsHidden
        passwordBtn.setImage(UIImage(systemName: passwordIsHidden ? "eye" : "eye.slash"), for: .normal)
        if passwordIsHidden {
            passwordField.isSecureTextEntry = true
        } else {
            passwordField.isSecureTextEntry = false
        }
    }
    
}

// MARK: - FlagPhoneNumber Delegates

extension LoginViewController: FPNTextFieldDelegate {
    
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        
    }
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        
    }
    
    func fpnDisplayCountryList() {
        
    }
    
}
