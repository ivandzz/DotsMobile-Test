//
//  MainTabBarView.swift
//  DotsMobile-Test
//
//  Created by Іван Джулинський on 08.11.2025.
//

import SwiftUI

struct MainTabBarView: View {
    
    //MARK: - View body
    var body: some View {
        TabView {
            Tab("List", systemImage: "list.bullet.rectangle.fill") {
                ProductListView()
            }
            
            Tab("Favorites", systemImage: "star.fill") {
                ProductListView()
            }
        }
    }
}

#Preview {
    MainTabBarView()
        .environmentObject(ProductsManager())
        .environmentObject(FavoritesManager())
}
