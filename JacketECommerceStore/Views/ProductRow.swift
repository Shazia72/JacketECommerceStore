//
//  ProductRow.swift
//  JacketECommerceStore
//
//  Created by Shazia Vohra on 2023-11-19.
//

import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        HStack(spacing: 20){
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10){
                Text("\(product.name)")
                    .bold()
                HStack (spacing: 10){
                    Text("$\(product.price, specifier: "%.2f")")
                    Spacer()
                    Button(action: {
                        print("minus \(cartManager.total)")
                        let index = cartManager.getIndex(product: product)
                        if  cartManager.products[index].quantity > 0 {
                            cartManager.products[index].quantity -= 1
                            cartManager.total -= cartManager.products[index].price
                        }
                    }){
                        Image(systemName: "minus").foregroundColor(.black)
                    }
                    Text("\(product.quantity)").foregroundColor(.black)
                        .padding(.vertical,5)
                        .padding(.horizontal, 10)
                        .background(Color(.black).opacity(0.06))
                    
                    Button(action: {
                        print("plus \(cartManager.total)")
                        let index = cartManager.getIndex(product: product)
                        cartManager.products[index].quantity += 1
                        cartManager.total += cartManager.products[index].price
                    }){
                        Image(systemName: "plus").foregroundColor(.black)
                    }
                    Spacer()
                    Image(systemName: "trash")
                        .foregroundColor(Color(hue:1.0, saturation: 0.89,brightness: 0.835))
                        .onTapGesture {
                            cartManager.removeFromCart(product: product)
                        }
                }
            }
            Spacer()
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ProductRow(product: productList[3])
        .environmentObject(CartManager())
}
