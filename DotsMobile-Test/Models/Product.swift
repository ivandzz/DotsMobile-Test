//
//  Product.swift
//  DotsMobile-Test
//
//  Created by Іван Джулинський on 08.11.2025.
//

import Foundation

struct Product: Identifiable, Decodable {
    
    let id: Int
    let name: String
    let category: String
    let price: Double
    let description: String
}
