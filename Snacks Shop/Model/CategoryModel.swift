//
//  CategoryModel.swift
//  Snacks Shop
//
//  Created by Hend El Mahdy on 25/06/2025.
//

import SwiftUI

struct CategoryModel: Identifiable, Hashable {
    let id: UUID = .init()
    let categoryName: String
    let icon: String
}
