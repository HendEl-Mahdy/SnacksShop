//
//  NavigationCoordinator.swift
//  Snacks Shop
//
//  Created by Hend El Mahdy on 27/06/2025.
//

import SwiftUI

class NavigationCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    enum Destination: Hashable {
        case products(category: String)
    }
    
    func navigate(to destination: Destination) {
        path.append(destination)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        //path = NavigationPath()
        path.removeLast(path.count)
    }
}
