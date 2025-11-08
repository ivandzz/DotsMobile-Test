//
//  FavoritesListView.swift
//  DotsMobile-Test
//
//  Created by Іван Джулинський on 08.11.2025.
//

import SwiftUI

struct FavoritesListView: View {
    
    //MARK: - Properties
    @EnvironmentObject private var productsManager: ProductsManager
    @EnvironmentObject private var favoritesManager: FavoritesManager
    
    private var favoriteProducts: [Product] {
        productsManager.products.filter { favoritesManager.favorites.contains($0.id) }
    }
    
    //MARK: - View body
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    LazyVStack(spacing: 12) {
                        if favoriteProducts.isEmpty {
                            Text("No favorite products yet")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(.primary)
                        } else {
                            ForEach(favoriteProducts) { product in
                                NavigationLink {
                                    ProductDetailsView(product: product)
                                } label: {
                                    ProductCellView(product: product)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favorite Products")
        }
    }
}

#Preview {
    FavoritesListView()
        .environmentObject(ProductsManager())
        .environmentObject(FavoritesManager())
}
