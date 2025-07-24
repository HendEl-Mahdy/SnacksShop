//
//  ProductsView.swift
//  Snacks Shop
//
//  Created by Hend El Mahdy on 26/06/2025.
//

import SwiftUI

struct ProductsView: View {
    var category: String
    @EnvironmentObject private var coordinator: NavigationCoordinator
    var body: some View {
        VStack {
            HStack {
                Text("**\(category)** Collection")
                    .font(.system(size: 36))
                
                Spacer()
                Button {
                    coordinator.pop()
                } label: {
                    Image(systemName: "arrow.left")
                        .tint(.black)
                        .imageScale(.large)
                        .frame(width: 40, height: 70)
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.gray,lineWidth: 3).opacity(0.1)
                        }
                }
                
            }.padding(.horizontal, 30)
                .padding(.vertical, 20)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    if category == "All"{
                        ForEach(productList, id: \.id) { product in
                            SmallProductCard(product: product)
                        }
                    }else {
                        ForEach(productList, id: \.id) { product in
                            if product.category == category {
                                SmallProductCard(product: product)
                            }
                        }
                    }
                    ForEach(productList, id: \.id) { product in
                        if product.category == category {
                            SmallProductCard(product: product)
                        }
                    }
                    
                }.padding(.horizontal)
            }
            
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ProductsView(category: "Choco")
        .environmentObject(NavigationCoordinator())
}
