//
//  SystemViewController.swift
//  MintynApp
//
//  Created by Emmanuel Omokagbo on 10/11/2021.
//

import UIKit

class SystemViewController: UIViewController {
    
    // MARK: - Properties
    
    private let appearanceLbl: UILabel = {
        let label = UILabel()
        label.text = "Appearance"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.separatorStyle = .none
        return table
    }()
    
    private let options = ["Default", "Light Mode", "Dark Mode"]
    
    // MARK: - ViewController LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "System"
        view.addSubview(appearanceLbl)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        appearanceLbl.frame = CGRect(x: 20, y: 100, width: 100, height: 20)
        tableView.frame = CGRect(x: 0, y: 150, width: view.frame.width, height: 500)
    }
    
}

// MARK: - UITableView Extensions

extension SystemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = options[indexPath.row]
        if indexPath.row == 0 { cell.accessoryType = .checkmark }
        return cell
    }
}


extension SystemViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        if cell.accessoryType == .none {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
}
