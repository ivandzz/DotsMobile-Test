//
//  DotsMobile_TestApp.swift
//  DotsMobile-Test
//
//  Created by Іван Джулинський on 08.11.2025.
//

import SwiftUI
import CoreData

@main
struct DotsMobile_TestApp: App {
    
    //MARK: - Properties
    @StateObject private var productsManager = ProductsManager()
    @StateObject private var favoritesManager = FavoritesManager()

    //MARK: - Scene body
    var body: some Scene {
        WindowGroup {
            MainTabBarView()
                .environmentObject(productsManager)
                .environmentObject(favoritesManager)
        }
    }
}
