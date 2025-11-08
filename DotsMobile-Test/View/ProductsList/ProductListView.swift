//
//  ProductListView.swift
//  DotsMobile-Test
//
//  Created by Іван Джулинський on 08.11.2025.
//

import SwiftUI
import CoreData

struct ProductListView: View {
    
    //MARK: - Properties
    @EnvironmentObject private var productsManager: ProductsManager
    
    @State private var query = ""
    
    private var filteredProducts: [Product] {
        productsManager.products.filter { $0.name.lowercased().contains(query.lowercased()) || query.isEmpty}
    }
    
    //MARK: - View body
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    LazyVStack(spacing: 12) {
                        if filteredProducts.isEmpty {
                            Text("No products found")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(.primary)
                        } else {
                            ForEach(filteredProducts) { product in
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
            .navigationTitle("List of Products")
            .searchable(text: $query)
        }
    }
}

#Preview {
    ProductListView()
        .environmentObject(ProductsManager())
        .environmentObject(FavoritesManager())
}
