//
//  ProductCard.swift
//  Snacks Shop
//
//  Created by Hend El Mahdy on 26/06/2025.
//

import SwiftUI

struct ProductCard: View {
    var product: ProductModel
    var body: some View {
        ZStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 350)
                .padding(.trailing, -150)
                .rotationEffect(Angle(degrees: 30 ))
            ZStack{
                VStack {
                    HStack {
                        VStack {
                            Text(product.name)
                                .font(.largeTitle.bold())
                                .frame(width: 140)
                            Text(product.category)
                                .font(.callout)
                                .frame(width: 100, height: 60)
                                .background(.white.opacity(0.6))
                                .clipShape(.capsule)
                                .padding(.leading, -17)
                            
                        }.padding(.leading, -10)
                            .padding(.top, 20)
                        Spacer()
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text(String(format: "$%.2f", product.price))
                            .font(.system(size: 25).bold())
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .foregroundStyle(.white)
                                .frame(width: 80, height: 60)
                                .background(.black)
                                .clipShape(.capsule)
                        }
                        
                    }.padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .background(.ultraThinMaterial.opacity(0.9))
                        .clipShape(.capsule)
                }
            }
            
        }.padding()
            .frame(width: 320, height: 400)
            .background(product.color)
            .clipShape(RoundedRectangle(cornerRadius: 50))
        
        
    }
}
