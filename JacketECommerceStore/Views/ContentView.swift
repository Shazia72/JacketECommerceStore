//
//  ContentView.swift
//  JacketECommerceStore
//
//  Created by Shazia Vohra on 2023-11-17.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    
    @EnvironmentObject var viewModel : AppViewModel
    
    var myColumns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: myColumns, spacing: 20) {
                    ForEach(productList, id:\.id){
                        product in ProductCard(product: product)
                            .environmentObject(cartManager)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("Jacket Shop"))
            .toolbar{
                NavigationLink{
                    CartView()
                        .environmentObject(cartManager)
                } label: {
                    CartButton(numberOfProducts: cartManager.products.count)
                }
                Text("\(viewModel.username)")
                if viewModel.username != ""{
                    Button(action: {
                        viewModel.signOut()
                    }, label: {
                        Text("Sign out").font(Font.system(size: 12))
                            .foregroundColor(.black)
                    })
                }
                else{
                    Button(action: {
                        viewModel.signin = false
                    }, label: {
                        Text("Login").font(Font.system(size: 12))
                            .foregroundColor(.black)
                    })
                }
            }
        }.padding(.bottom, 2)
    }
}

#Preview {
    ContentView().environmentObject(AppViewModel())
}
