//
//  Product.swift
//  JacketECommerceStore
//
//  Created by Shazia Vohra on 2023-11-19.
//

import Foundation

struct Product: Identifiable{
    var id = UUID()
    var name:String
    var image: String
    var price: Int
}

var productList = [Product(name: "Black", image: "jacket1", price: 100),
                   Product(name: "Brown", image: "jacket2", price: 200),
                   Product(name: "Beige", image: "jacket3", price: 300),
                   Product(name: "Brown", image: "jacket4", price: 200),
                   Product(name: "Black Leather", image: "jacket5", price: 500),
                   Product(name: "Blue", image: "jacket6", price: 90),
                   Product(name: "Women Jacket", image: "jacket7", price: 400),
                   Product(name: "Army Jacket", image: "jacket8", price: 700)

]
