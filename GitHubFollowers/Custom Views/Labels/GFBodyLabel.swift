//
//  GFBodyLabel.swift
//  GitHubFollowers
//
//  Created by Cansu Kahraman on 1.03.2024.
//

import UIKit

final class GFBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
        
    }
    
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        configure()
    }
    
    func configure() {
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .headline)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.2
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}
