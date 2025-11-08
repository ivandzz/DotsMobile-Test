//
//  ProductDetailsView.swift
//  DotsMobile-Test
//
//  Created by Іван Джулинський on 08.11.2025.
//

import SwiftUI

struct ProductDetailsView: View {
    
    //MARK: - Properties
    @EnvironmentObject private var favoritesManager: FavoritesManager
    
    let product: Product
    
    private var isFavorite: Bool {
        favoritesManager.isFavorite(product.id)
    }
    
    //MARK: - View body
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                HStack {
                    Text(product.name)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.primary)
                    
                    Spacer()
                    
                    Text(String(product.price))
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(.primary)
                }
                .padding(.horizontal, 16)
                
                Text(product.category)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                Text(product.description)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
            }
            .padding(.top, 32)
            
            Spacer()
            
            Button {
                favoritesManager.toggle(id: product.id)
            } label: {
                Text(isFavorite ? "Remove from Favorites" : "Add to Favorites")
                    .font(.system(size: 16, weight: .medium))
                    .padding(12)
                    .foregroundStyle(.primary)
                    .background(isFavorite ? .red : .green)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .buttonStyle(.plain)
            .padding(.bottom, 32)
        }
        .navigationTitle("Product Details")
    }
}

#Preview {
    ProductDetailsView(product: Product(id: 1, name: "Example", category: "Example", price: 1.99, description: "Lorem ipsum"))
        .environmentObject(FavoritesManager())
}
