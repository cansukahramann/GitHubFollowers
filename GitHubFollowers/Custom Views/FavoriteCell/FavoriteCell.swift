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
        NetworkManager.shared.downloadImage(from: favorite.avatarUrl) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.avatarImageView.image = image
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
