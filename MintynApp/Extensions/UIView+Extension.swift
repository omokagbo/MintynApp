//
//  UIView+Extension.swift
//  MintynApp
//
//  Created by Emmanuel Omokagbo on 09/11/2021.
//

import UIKit

extension UIView {
    
    var identifier: String {
        return String(describing: self)
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            self.layer.cornerRadius
        } set {
            self.cornerRadius = newValue
        }
    }
    
}
