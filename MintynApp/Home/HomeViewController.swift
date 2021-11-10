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
    
    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var accountDetails: UIButton!
    
    @IBOutlet weak var copyBtn: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var availableBalance: UILabel!
    
    @IBOutlet weak var ledgerBalance: UILabel!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    // MARK: - Properties
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "mintyn title")
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        return imageView
    }()
    
    private let referImages = [UIImage(named: "refer and earn"), UIImage(named: "refer and win")]
    
    // MARK: - ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem?.isEnabled = false
        navigationController?.navigationBar.tintColor = .systemGray2
        setupNavigationItems()
        customiseViews()
        setupCollectionView()
        navigationController?.navigationBar.isTranslucent = false
    }
    
// MARK: - Actions
    
    @IBAction func didTapAccountDetails(_ sender: UIButton) {
        self.showDefaultAlert(title: "Account", message: "Your account number is: 1234567890")
    }
    
    @IBAction func didHideBalance(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            availableBalance.text = Constants.hiddenBalance
            ledgerBalance.text = Constants.hiddenBalance
        } else {
            availableBalance.text = Constants.defaultBalance
            ledgerBalance.text = Constants.defaultBalance
        }
    }
    
    @IBAction func didTapCopy(_ sender: UIButton) {
        self.showDefaultAlert(title: "Copy", message: "Account number copied to clipboard")
    }
    
    @IBAction func didTapNewAccount(_ sender: UIButton) {
        self.showDefaultAlert(title: "New", message: "Creating a new account...")
    }
    
    @IBAction func fundAccount(_ sender: UIButton) {
        self.showDefaultAlert(title: "Fund Account", message: "How do you want to fund your account?")
    }
    
    // MARK: - Methods
    
    private func customiseViews() {
        floatingButton.layer.cornerRadius = 30
        copyBtn.layer.cornerRadius = 8
        profilePicture.layer.cornerRadius = 20
    }
    
    private func setupNavigationItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell.badge.fill"), style: .plain, target: self, action: #selector(didTapNotifications))
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
    }
    
    @objc private func didTapNotifications() {
        self.showDefaultAlert(title: "Notifications", message: "You have no new notification")
    }
    
}

// MARK: - UICollectionView Extensions

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        referImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setup(with: (referImages[indexPath.row]!))
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: self.collectionView.frame.width - 10, height: 80)
    }
}
