//
//  PersitenceManager.swift
//  GitHubFollowers
//
//  Created by Cansu Kahraman on 22.03.2024.
//

import Foundation

enum PersitenceActionType {
    case add, remove
}

enum PersitenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func retrieveFavorites(completion: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completion(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completion(.success(favorites))
        } catch {
            completion(.failure(.unableToFavorite))
        }
    }
    
    static func save(favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.setValue(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
    
    static func updateWith(favorite: Follower, actionType: PersitenceActionType, completion: @escaping(GFError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retrievedFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !retrievedFavorites.contains(favorite) else {
                        completion(.alreadyInFavorites)
                        return
                    }
                    retrievedFavorites.append(favorite)
                    
                case .remove:
                    retrievedFavorites.removeAll { $0.login == favorite.login }
                }
                
                completion(save(favorites: retrievedFavorites))
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
