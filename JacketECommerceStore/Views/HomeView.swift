//
//  HomeView.swift
//  JacketECommerceStore
//
//  Created by Shazia Vohra on 2023-11-19.
//
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = AppViewModel()
    var body: some View {
        NavigationView{
            if viewModel.signin {
                ContentView().environmentObject(viewModel)
            }
            else{
                SignInView().environmentObject(viewModel)
            }
        }.onAppear {
            viewModel.signin = viewModel.isSignIn
        }
    }
}
#Preview {
    HomeView()
}
