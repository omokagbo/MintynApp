//
//  SettingsViewController.swift
//  MintynApp
//
//  Created by Emmanuel Omokagbo on 09/11/2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - Properties
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private let settingsViewModel: SettingsViewModel = SettingsViewModel()
    
    // MARK: - ViewController LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Settings"
        navigationController?.navigationBar.tintColor = .label
        setupNavbar()
        view.addSubview(tableView)
        setupTableView()
    }
    
    // MARK: - Methods
    
    private func setupTableView() {
        tableView.frame = view.bounds
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func logoutUser() {
        let alert = UIAlertController(title: "Logout", message: "Do you really want to logout?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { [weak self] _ in
            guard let self = self else { return }
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settingsViewModel.settingsOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = settingsViewModel.settingsOptions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.title
        cell.imageView?.image = UIImage(systemName: model.image)
        cell.imageView?.tintColor = .systemGray2
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = settingsViewModel.settingsOptions[indexPath.row]
        
        if model.title == "Legal" {
            let legalVC = LegalViewController()
            self.navigationController?.pushViewController(legalVC, animated: true)
        } else if model.title == "System" {
            let systemVC = SystemViewController()
            self.navigationController?.pushViewController(systemVC, animated: true)
        } else if model.title == "Logout" {
            self.logoutUser()
        } else {
            self.showDefaultAlert(title: "\(model.title)", message: "Coming soon")
        }
    }
}
