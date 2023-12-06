//
//  CartManager.swift
//  JacketECommerceStore
//
//  Created by Shazia Vohra on 2023-11-19.
//

import Foundation
class CartManager: ObservableObject {
    
    @Published var products : [Product] = []
    @Published var total: Float = 00.00
    
    func addToCart(product: Product){
        let index = getIndex(product: product)
        if products.contains(where: {$0 == product}){
            products[index].quantity += 1
            total += product.price
        }
        else{
            products.append(product)
            total += product.price
        }
    }
    
    func getIndex(product: Product)-> Int{
        if products.contains(where: {$0 == product}){
            guard let index = products.firstIndex(where: {$0.name == product.name}) else { return  -1 }
            return index
        }
        else{
            return -1
        }
    }
    
    func removeFromCart(product:Product){
        products = products.filter { $0.id != product.id }
        total -= product.price * Float(product.quantity)
    }
}
