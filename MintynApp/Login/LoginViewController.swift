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
    
    @IBOutlet weak var rememberBtn: UIButton!
    
    // MARK: - Properties
    
    private let passwordBtn: UIButton = {
        let passwordBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        passwordBtn.setImage(UIImage(systemName: "eye"), for: .normal)
        passwordBtn.tintColor = .systemGray
        passwordBtn.addTarget(self, action: #selector(didTapHidePassword), for: .touchUpInside)
        return passwordBtn
    }()
    
    private var passwordIsHidden = true
    
    private var rememberMe = false
    
    var formattedPhoneNumber = ""
    
    var listController: FPNCountryListViewController = FPNCountryListViewController(style: .grouped)
    
    // MARK: - ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.layer.cornerRadius = 30
        self.navigationItem.hidesBackButton = true
        setupGesturesForImages()
        setupNavbar()
        customisePhoneNumberField()
        passwordField.rightView = passwordBtn
        passwordField.rightViewMode = .always
    }
    
    // MARK: - Actions
    
    @IBAction func didTapRememberMe(_ sender: UIButton) {
        rememberMe = !rememberMe
        rememberBtn.setImage(UIImage(systemName: rememberMe ? "checkmark.square" : "square"), for: .normal)
    }
    
    @IBAction func didTapLoginButton(_ sender: UIButton) {
//        guard let phone = phoneNumberField.text, !phone.isEmpty, let password = passwordField.text, !password.isEmpty else {
//            return
//        }
        let dashboardVC = DashboardTabBarController()
        dashboardVC.modalPresentationStyle = .fullScreen
        self.present(dashboardVC, animated: true)
    }
    
    // MARK: - Methods
    
    private func customisePhoneNumberField() {
        phoneNumberField.delegate = self
        phoneNumberField.setFlag(key: .NG)
        phoneNumberField.placeholder = "802 123 4567"
        
        phoneNumberField.displayMode = .list
        
        listController.setup(repository: phoneNumberField.countryRepository)
        
        listController.didSelect = { [weak self] country in
            self?.phoneNumberField.setFlag(countryCode: country.code)
        }
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
        print(name, dialCode, code)
    }
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        if isValid {
            self.formattedPhoneNumber = "\(textField.getFormattedPhoneNumber(format: .E164) ?? "2348000000000")"
        }
    }
    
    func fpnDisplayCountryList() {
        let navigationController = UINavigationController(rootViewController: listController)
        
        listController.title = "Countries"
        
        self.present(navigationController, animated: true)
    }
    
    
}
