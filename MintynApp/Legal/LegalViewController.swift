//
//  LegalViewController.swift
//  MintynApp
//
//  Created by Emmanuel Omokagbo on 10/11/2021.
//

import UIKit
import WebKit

class LegalViewController: UIViewController {
    
    // MARK: - Properties
    
    private let options = ["Mintyn Account - Terms & Conditions", "Mintyn Privacy Policy", "Saving Goal - Terms & Conditions"]
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.separatorStyle = .none
        return table
    }()

    // MARK: - ViewController LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "System"
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
    }

}

// MARK: - UITableView Extensions

extension LegalViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = options[indexPath.row]
        cell.accessoryType = .detailButton
        return cell
    }
}


extension LegalViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
       
    }
}

