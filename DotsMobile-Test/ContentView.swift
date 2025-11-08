//
//  ContentView.swift
//  DotsMobile-Test
//
//  Created by Іван Джулинський on 08.11.2025.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @EnvironmentObject private var productsManager: ProductsManager

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    LazyVStack(spacing: 12) {
                        ForEach(productsManager.products) { product in
                            NavigationLink {
                                
                            } label: {
                                makeProductCell(for: product)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
            .navigationTitle("List of Products")
        }
        .onAppear {
            productsManager.fetchProducts()
        }
    }
    
    private func makeProductCell(for product: Product) -> some View {
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
                .foregroundStyle(.primary)
            
            Image(systemName: "star")
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
    ContentView()
        .environmentObject(ProductsManager())
//        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
