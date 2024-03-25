//
//  FavoriteCell.swift
//  GitHubFollowers
//
//  Created by Cansu Kahraman on 22.03.2024.
//

import UIKit

class FavoriteCell: UITableViewCell {

    @IBOutlet var avatarImageView: GFAvatarImageView!
    @IBOutlet var usernameLabel: GFTitleLabel!
    
    static let identifer = String(describing: FavoriteCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(favorite: Follower) {
        usernameLabel.text = favorite.login
        avatarImageView.downloadImage(from: favorite.avatarUrl)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
