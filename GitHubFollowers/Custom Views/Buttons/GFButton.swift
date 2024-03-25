//
//  GFButton.swift
//  GitHubFollowers
//
//  Created by Cansu Kahraman on 26.02.2024.
//

import UIKit

final class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        
        backgroundColor = .red
        layer.cornerRadius = 15
        layer.borderWidth = 12
        layer.borderColor = UIColor.black.cgColor
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    convenience init(backgroundColor: UIColor, title: String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
    
    private func configure() {
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        
    }
}
