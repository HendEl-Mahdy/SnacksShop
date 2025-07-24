//
//  Snacks_ShopApp.swift
//  Snacks Shop
//
//  Created by Hend El Mahdy on 25/06/2025.
//

import SwiftUI

@main
struct Snacks_ShopApp: App {
    @StateObject private var coordinator = NavigationCoordinator()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                Home()
                    .navigationDestination(for: NavigationCoordinator.Destination.self) { destination in
                        switch destination {
                        case .products(let category):
                            ProductsView(category: category)
                        }
                    }
            }
            .environmentObject(coordinator)
            
        }
    }
}
