//
//  Gradient Button.swift
//  MintynApp
//
//  Created by Emmanuel Omokagbo on 09/11/2021.
//

import UIKit

class ActualGradientButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        let color1 = UIColor(red: 148/255, green: 110/255, blue: 43/255, alpha: 1).cgColor
        let color2 = UIColor(red: 54/255, green: 40/255, blue: 16/255, alpha: 1).cgColor
        l.colors = [color1, color2]
        l.startPoint = CGPoint(x: 0, y: 0.5)
        l.endPoint = CGPoint(x: 1, y: 0.5)
        l.cornerRadius = 3
        layer.insertSublayer(l, at: 0)
        return l
    }()
}
