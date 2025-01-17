//
//  FavoritesListVC.swift
//  GitHubFollowers
//
//  Created by Cansu Kahraman on 26.02.2024.
//

import UIKit

final class FavoritesListVC: GFDataLoadingVC {
    
    @IBOutlet var tableView: UITableView!
    var favorites: [Follower] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        getFavorites()
        
        tableView.register(UINib(nibName: "FavoriteCell", bundle: nil),forCellReuseIdentifier: FavoriteCell.identifer)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getFavorites() {
        PersistenceManager.retrieveFavorites { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let favorites):
                if favorites.isEmpty {
                    showEmptyStateView(with: "No favorites?\nAdd one on the follower screen.", in: self.view)
                } else {
                    self.favorites = favorites
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
}

extension FavoritesListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite  = favorites[indexPath.row]
        let destVC = FollowersListVC(username: favorite.login)
        
        
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        PersistenceManager.updateWith(favorite: favorites[indexPath.row], actionType: .remove) { [weak self] error in
            guard let self = self else { return }
            guard let error = error else {
                self.favorites.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .left)
                return
            }
            self.presentGFAlertOnMainThread(title: "Unable to remove", message: error.rawValue, buttonTitle: "Ok")
        }
    }
}

extension FavoritesListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.identifer) as! FavoriteCell
        let favorite = favorites[indexPath.row]
        cell.set(favorite: favorite)
        return cell
    }
}
