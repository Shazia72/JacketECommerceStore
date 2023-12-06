//
//  SignInView.swift
//  JacketECommerceStore
//
//  Created by Shazia Vohra on 2023-11-30.
//

import SwiftUI

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel : AppViewModel
    
    var body: some View {
        NavigationView {
            VStack{
                TextField("Enter email", text: $email).textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                SecureField("Enter Password", text: $password).textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                Button(action: {
                    guard !email.isEmpty, !password.isEmpty else {return}
                    viewModel.signIn(email: email, password: password)
                }, label: {
                    Text("Login").fontWeight(.bold)
                        .frame(width: 200, height: 50)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(8)
                })
                Button(action: {
                    viewModel.signin = true
                }, label: {
                    Text("Continue without login").fontWeight(.bold)
                        .frame(width: 200, height: 50)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(8)
                })
                NavigationLink("Create Account", destination: SignUpView().environmentObject(viewModel))
                }
            }
            .padding()
            .navigationBarHidden(true)
    }
}

#Preview {
    SignInView()
        .environmentObject(AppViewModel())
}
