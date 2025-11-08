//
//  MainTabBarView.swift
//  DotsMobile-Test
//
//  Created by Іван Джулинський on 08.11.2025.
//

import SwiftUI

struct MainTabBarView: View {
    
    @EnvironmentObject private var productsManager: ProductsManager
    
    //MARK: - View body
    var body: some View {
        TabView {
            Tab("List", systemImage: "list.bullet.rectangle.fill") {
                ProductListView()
            }
            
            Tab("Favorites", systemImage: "star.fill") {
                FavoritesListView()
            }
        }
        .alert("Error",
               isPresented: Binding(
                get: { productsManager.errorMessage != nil },
                set: { newValue in
                    if !newValue { productsManager.errorMessage = nil }
                }
               )) {
                   Button("Try again",
                          role: .confirm) {
                       productsManager.errorMessage = nil
                       DispatchQueue.main.async {
                           productsManager.fetchProducts()
                       }
                   }
                   
                   Button("Cancel",
                          role: .cancel) {
                       productsManager.errorMessage = nil
                   }
               } message: {
                   Text(productsManager.errorMessage ?? "Unknown error. Try again.")
               }
    }
}

#Preview {
    MainTabBarView()
        .environmentObject(ProductsManager())
        .environmentObject(FavoritesManager())
}
