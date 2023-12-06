//
//  Product.swift
//  JacketECommerceStore
//
//  Created by Shazia Vohra on 2023-11-19.
//

import Foundation

struct Product: Identifiable, Equatable{
    var id = UUID().uuidString
    var name:String
    var image: String
    var price: Float
    var quantity: Int
}

var productList = [Product(name: "Black", image: "jacket1", price: 1.00, quantity: 1),
                   Product(name: "Brown", image: "jacket2", price: 2.00, quantity: 1),
                   Product(name: "Beige", image: "jacket3", price: 1.00, quantity: 1),
                   Product(name: "Brown", image: "jacket4", price: 3.00, quantity: 1),
                   Product(name: "Black Leather", image: "jacket5", price: 1.00, quantity: 1),
                   Product(name: "Blue", image: "jacket6", price: 1.00, quantity: 1),
                   Product(name: "Women Jacket", image: "jacket7", price: 1.00, quantity: 1),
                   Product(name: "Army Jacket", image: "jacket8", price: 1.00, quantity: 1)
]
