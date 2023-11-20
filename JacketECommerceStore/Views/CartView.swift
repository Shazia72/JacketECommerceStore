//
//  CartView.swift
//  JacketECommerceStore
//
//  Created by Shazia Vohra on 2023-11-19.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        ScrollView{
            if cartManager.products.count > 0{
                ForEach(cartManager.products, id: \.id){
                    product in ProductRow(product:product)
                }
                HStack{
                    Text("Your cart total is")
                    Spacer()
                    Text("$\(cartManager.total).00")
                        .bold()
                }
                .padding()
                
                PaymentButton(action: {})
                    .padding()
            }
                else{
                    Text("Your cart is empty")
                
            }
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}

