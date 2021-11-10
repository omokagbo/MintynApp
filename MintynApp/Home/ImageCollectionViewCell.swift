//
//  ImageCollectionViewCell.swift
//  MintynApp
//
//  Created by Emmanuel Omokagbo on 10/11/2021.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ImageCollectionViewCell"
    
    public let referImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray6
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(referImageView)
        referImageView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unable to create cell")
    }
    
    public func setup(with image: UIImage) {
        self.referImageView.image = image
    }
}
