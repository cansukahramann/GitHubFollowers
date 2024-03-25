//
//  UserInfoVC.swift
//  GitHubFollowers
//
//  Created by Cansu Kahraman on 12.03.2024.
//

import UIKit

enum ItemInfoType {
    case repos, gists, followers, following
}

final class UserInfoVC: UIViewController {
    
    @IBOutlet var avatarImageView: GFAvatarImageView!
    @IBOutlet var usernameLabel: GFTitleLabel!
    @IBOutlet var nameLabel: GFSecondaryTitleLabel!
    @IBOutlet var locationLabel: GFSecondaryTitleLabel!
    @IBOutlet var bioLabel: GFBodyLabel!
    @IBOutlet var reposCountLabel: UILabel!
    @IBOutlet var gistsCountLabel: UILabel!
    @IBOutlet var followingCountLabel: UILabel!
    @IBOutlet var followersCountLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    var username: String!
    private var user: User!
    
    weak var delegate: FollowerListVCDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                    self.user = user
                    self.configureUIElements()
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    func configureUIElements() {
        avatarImageView.downloadImage(from: user.avatarUrl)
        usernameLabel.text = user.login
        nameLabel.text = user.name ?? ""
        locationLabel.text = user.location ?? "No Location"
        bioLabel.text = user.bio ?? "No bio available"
        dateLabel.text = "GitHub since \(user.createdAt.convertToDisplayFormat())"
        
        
        set(itemInfoType: .followers, withCount: user.followers)
        set(itemInfoType: .following, withCount: user.following)
        set(itemInfoType: .gists, withCount: user.publicGists)
        set(itemInfoType: .repos, withCount: user.publicRepos)
    }
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
        switch itemInfoType {
        case .repos:
            reposCountLabel.text = String(count)
        case .gists:
            gistsCountLabel.text = String(count)
        case .followers:
            followersCountLabel.text = String(count)
        case .following:
            followingCountLabel.text = String(count)
        }
    }
    @IBAction func gitHubProfileButtonTapped(_ sender: Any) {
        
        guard let url = URL(string: user.htmlUrl)  else {
            presentGFAlertOnMainThread(title: "Invalid URL", message: "The url attached to this user is invalid", buttonTitle: "Ok")
            return
        }
        presentSafariVC(with: url)
    }
    @IBAction func didTapGetFollowers(_ sender: Any) {
        guard  user.followers != 0 else {
            presentGFAlertOnMainThread(title: "No followers", message: "This user has no followers. What a shame.🥺", buttonTitle: "So sad")
            return
        }
        delegate.didRquestFollowers(for: user.login)
        dismissVC()
    }
}

