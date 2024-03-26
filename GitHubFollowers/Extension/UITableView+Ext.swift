//
//  UITableView+Ext.swift
//  GitHubFollowers
//
//  Created by Cansu Kahraman on 26.03.2024.
//

import UIKit

extension UITableView {
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
