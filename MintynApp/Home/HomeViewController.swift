//
//  HomeViewController.swift
//  MintynApp
//
//  Created by Emmanuel Omokagbo on 09/11/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var floatingButton: UIButton!
    
    // MARK: - Properties
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "mintyn title")
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return imageView
    }()
    
    // MARK: - ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem?.isEnabled = false
        navigationController?.navigationBar.tintColor = .systemGray2
        setupNavigationItems()
        customiseViews()
    }
    
    // MARK: - Methods
    
    private func customiseViews() {
        floatingButton.layer.cornerRadius = 30
    }
    
    private func setupNavigationItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell.badge.fill"), style: .plain, target: self, action: #selector(didTapNotifications))
    }
    
    @objc private func didTapNotifications() {
        self.showDefaultAlert(title: "Notifications", message: "Coming Soon")
    }
    
    @objc private func tapNothing() {
        
    }
}
