//
//  CartManager.swift
//  JacketECommerceStore
//
//  Created by Shazia Vohra on 2023-11-19.
//

import Foundation
class CartManager: ObservableObject {
    
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    
    func addToCart(product: Product){
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product:Product){
        products = products.filter { $0.id != product.id }
		// there's a small bug here, if you remove one product, all of the same type ones would be removed as well
        total -= product.price
    }
}
