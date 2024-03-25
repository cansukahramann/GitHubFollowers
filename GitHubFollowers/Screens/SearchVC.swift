//
//  SearchVC.swift
//  GitHubFollowers
//
//  Created by Cansu Kahraman on 26.02.2024.
//

import UIKit

final class SearchVC: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var usernameTextField: GFTextField!
    
    var isUserNameEntered: Bool { return !usernameTextField.text!.isEmpty}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    
        usernameTextField.delegate = self
        createDissmisKeyboardTabGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func createDissmisKeyboardTabGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    func pushFollowerListVC() {
        guard isUserNameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username.We need to know who to look for.  😊", buttonTitle: "Ok")
            return
        }
        let followersListVC = FollowersListVC()
        followersListVC.username = usernameTextField.text
        followersListVC.title = usernameTextField.text
        if let navigationController = navigationController {
            navigationController.pushViewController(followersListVC, animated: true)
        }
    }
    
    @IBAction func getFollowersButton(_ sender: Any) {
        pushFollowerListVC()
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
