//
//  SignUpView.swift
//  JacketECommerceStore
//
//  Created by Shazia Vohra on 2023-11-30.
//

import SwiftUI

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack {
            
            TextField("Enter email", text: $email).textFieldStyle(.roundedBorder)
            SecureField("Enter Password", text: $password).textFieldStyle(.roundedBorder)
            Button(action: {
                guard !email.isEmpty, !password.isEmpty else {return}
                viewModel.signUp(email: email, password: password)
                
            }, label: {
                Text("Sign Up").fontWeight(.bold)
                    .frame(width: 200, height: 50)
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(8)
            })
        }.padding()
            .navigationTitle("Create Account")
    }
}

#Preview {
    SignUpView().environmentObject(AppViewModel())
}
