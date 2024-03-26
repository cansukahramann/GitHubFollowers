//
//  UIView+Ext.swift
//  GitHubFollowers
//
//  Created by Cansu Kahraman on 28.02.2024.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

