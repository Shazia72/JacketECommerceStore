//
//  HomeView.swift
//  JacketECommerceStore
//
//  Created by Shazia Vohra on 2023-11-19.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject {
    @EnvironmentObject var viewModel: AppViewModel
    @Published var signin = false
    let auth = Auth.auth()
    
    var isSignIn : Bool {
        return auth.currentUser != nil
    }
    var username: String {
        return auth.currentUser?.email ?? ""
    }
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                self.signin = false
                return}
            
            DispatchQueue.main.async {
                self.signin = true
            }
        }
        
    }
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password) {result, error in
            guard result != nil, error == nil else {
                self.signin = false
                return}
            
            DispatchQueue.main.async {
                self.signin = true
            }
        }
    }
    func signOut(){
        print("sign out")
        try? auth.signOut()
        self.signin = false
    }
    
}

struct HomeView: View {
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        NavigationView{
            if viewModel.signin {
                //VStack{
                    ContentView()
                //}
            }
            else{
                SignInView()
            }
        }.onAppear {
            viewModel.signin = viewModel.isSignIn
        }
    }
}

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppViewModel
    
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
                NavigationLink("Create Account", destination: SignUpView())
                //NavigationLink("Continue without login", destination: ContentView())
                }
            }
            .padding()
            .navigationBarHidden(true)
            //.navigationViewStyle(.stack)
    }
}

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
    HomeView()
}
