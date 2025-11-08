//
//  ProductCellView.swift
//  DotsMobile-Test
//
//  Created by Іван Джулинський on 08.11.2025.
//

import SwiftUI

struct ProductCellView: View {
    
    @EnvironmentObject private var favoritesManager: FavoritesManager
    
    let product: Product
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.primary)
                
                Text(product.category)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Text(String(product.price))
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.primary)
            
            Image(systemName: favoritesManager.isFavorite(product.id) ? "star.fill" : "star")
                .bold()
                .foregroundStyle(.yellow)
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 8)
        .background(.quaternary)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.horizontal, 16)
    }
}

#Preview {
    ProductCellView(product: Product(id: 1, name: "Example", category: "Example", price: 1.99, description: "Lorem ipsum"))
        .environmentObject(ProductsManager())
}
