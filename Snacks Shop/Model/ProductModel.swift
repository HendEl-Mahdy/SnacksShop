//
//  ProductModel.swift
//  Snacks Shop
//
//  Created by Hend El Mahdy on 25/06/2025.
//

import SwiftUI

struct ProductModel: Identifiable {
    let id: UUID = .init()
    let name: String
    let category: String
    let image: String
    let price: Float
    let color: Color
}

