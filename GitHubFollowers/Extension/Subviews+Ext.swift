//
//  Subviews+Ext.swift
//  GitHubFollowers
//
//  Created by Cansu Kahraman on 12.03.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {  addSubview($0) }
    }
} 
