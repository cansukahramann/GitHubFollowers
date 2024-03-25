//
//  GFTabBarController.swift
//  GitHubFollowers
//
//  Created by Cansu Kahraman on 25.03.2024.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createSearchNC(), createFavoritesNC()]
    }
    
    func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavoritesNC() -> UINavigationController {
        let favoritesListVC = FavoritesListVC()
        favoritesListVC.title = "Favorites"
        favoritesListVC.tabBarItem = UITabBarItem(tabBarSystemItem:.favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoritesListVC)
    }
//    func createTabbar() -> UITabBarController {
//        let tabbar = UITabBarController()
//        
//        let appearance = UITabBarAppearance()
//        appearance.configureWithDefaultBackground()
//        UITabBar.appearance().standardAppearance = appearance
//        UITabBar.appearance().scrollEdgeAppearance = appearance
//        
//        return tabbar
//    }
    
    
}
