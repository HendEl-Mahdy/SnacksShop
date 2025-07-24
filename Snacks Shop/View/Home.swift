//
//  Home.swift
//  Snacks Shop
//
//  Created by Hend El Mahdy on 25/06/2025.
//

import SwiftUI

struct Home: View {
    @State var selectedCatedgory = "Choco"
    @EnvironmentObject private var coordinator: NavigationCoordinator
    
    var body: some View {
        VStack {
            // Header
            headerView
            
            // Category List
            categoryListView
            
            // Collection Header
            collectionHeaderView
            
            // Product Grid
            productGrid
        }
    }
    
    var headerView: some View {
        HStack {
            Text("Order From The Best Of **Snacks**")
                .font(.system(size: 36))
            
            Spacer()
            Image(systemName: "line.3.horizontal")
                .imageScale(.large)
                .frame(width: 40, height: 70)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(lineWidth: 3).opacity(0.1)
                }
            
        }.padding(.horizontal, 30)
            .padding(.vertical, 20)
    }
    
    var categoryListView: some View {
        HStack(spacing: 20, content: {
            ForEach(categoryList, id: \.id) { item in
                Button {
                    selectedCatedgory = item.categoryName
                } label: {
                    HStack {
                        if item.categoryName != "All" {
                            Image(item.icon)
                                .resizable()
                                .renderingMode(.template)
                                .foregroundStyle(selectedCatedgory == item.categoryName ? Color("Light_Yellow") : .black)
                                .frame(width: 20, height: 20)
                        }
                        if item.categoryName == "All" || selectedCatedgory == item.categoryName {
                            Text(item.categoryName)
                                .font(.system(size: 15))
                        }
                    }.padding(22)
                        .background(selectedCatedgory == item.categoryName ? .black : .gray.opacity(0.2))
                        .foregroundStyle(selectedCatedgory == item.categoryName ? .white : .black)
                        .clipShape(.capsule)
                }
                
            }
        }).padding(.horizontal)
    }
    var collectionHeaderView: some View {
        HStack {
            Text("\(selectedCatedgory) **Collections**")
                .font(.title)
            Spacer()
            Button {
                coordinator.navigate(to: .products(category: selectedCatedgory))
            } label: {
                Image(systemName: "arrow.forward")
                    .imageScale(.large)
                    .foregroundStyle(.black)
                    .padding(.trailing)
            }
            
        }.padding(.horizontal, 25)
    }
    
    var productGrid: some View {
        ScrollView(.horizontal, content: {
            LazyHStack {
                if selectedCatedgory == "All" {
                    ForEach(productList, id: \.id) { product in
                        ProductCard(product: product)
                        
                    }.padding(.horizontal,10)
                }
                else {
                    ForEach(productList, id: \.id) { product in
                        if product.category == selectedCatedgory {
                            ProductCard(product: product)
                        }
                    }.padding(.horizontal,10)
                }
            }.padding(.horizontal, 20)
        })
    }
}

#Preview {
    Home()
        .environmentObject(NavigationCoordinator())
}
