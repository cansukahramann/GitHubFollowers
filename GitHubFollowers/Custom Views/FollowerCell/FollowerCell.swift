//
//  FollowerCell.swift
//  GitHubFollowers
//
//  Created by Cansu Kahraman on 6.03.2024.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    @IBOutlet var avatarImageView: GFAvatarImageView!
    @IBOutlet var usernameLabel: GFTitleLabel!
    
    static let identifer = String(describing: FollowerCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set (follower: Follower) {
        usernameLabel.text = follower.login
        NetworkManager.shared.downloadImage(from: follower.avatarUrl) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.avatarImageView.image = image
            }
        }
    }
}
