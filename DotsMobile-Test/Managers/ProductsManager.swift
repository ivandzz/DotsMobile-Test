//
//  ProductsManager.swift
//  DotsMobile-Test
//
//  Created by Іван Джулинський on 08.11.2025.
//

import Foundation
import Combine

final class ProductsManager: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var errorMessage: String? = nil
    
    init() {
        fetchProducts()
    }

    func fetchProducts() {
        if let url = Bundle.main.url(forResource: "products", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Product].self, from: data)
                self.products = jsonData
            } catch {
                self.errorMessage = error.localizedDescription
                print("Error: \(error)")
            }
        }
    }
}
