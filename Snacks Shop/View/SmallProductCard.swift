//
//  SmallProductCard.swift
//  Snacks Shop
//
//  Created by Hend El Mahdy on 26/06/2025.
//

import SwiftUI

struct SmallProductCard: View {
    var product: ProductModel
    var body: some View {
        ZStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.trailing, -130)
                .rotationEffect(Angle(degrees: 30 ))
            ZStack{
                VStack {
                    HStack {
                        VStack {
                            Text(product.name)
                                .font(.system(size: 18).weight(.semibold))
                                .frame(width: 70)
                                .padding(.top, 10)
                            Text(product.category)
                                .font(.system(size: 12))
                                .frame(width: 70, height: 50)
                                .background(.white.opacity(0.6))
                                .clipShape(.capsule)
                        }
                        .padding(.leading, -5)
                        Spacer()
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text(String(format: "$%.2f", product.price))
                            .font(.system(size: 14).weight(.semibold))
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .foregroundStyle(.white)
                                .frame(width: 45, height: 40)
                                .background(.black)
                                .clipShape(.capsule)
                        }

                        
                    }.padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(.ultraThinMaterial.opacity(0.9))
                        .clipShape(.capsule)
                }
            }
            
        }.padding()
            .frame(width: 180, height: 215)
            .background(product.color)
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

