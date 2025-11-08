//
//  FavoritesManager.swift
//  DotsMobile-Test
//
//  Created by Іван Джулинський on 08.11.2025.
//

import Combine

final class FavoritesManager: ObservableObject {
    
    @Published private(set) var favorites: Set<Int> = []

    private let persistence = PersistenceController.shared

    init() {
        favorites = Set(persistence.fetchFavorites())
    }

    func toggle(id: Int) {
        if favorites.contains(id) {
            persistence.removeFavorite(with: id)
            favorites.remove(id)
        } else {
            persistence.addFavorite(with: id)
            favorites.insert(id)
        }
    }

    func isFavorite(_ id: Int) -> Bool {
        favorites.contains(id)
    }
}
