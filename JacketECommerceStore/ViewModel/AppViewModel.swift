//
//  AppViewModel.swift
//  JacketECommerceStore
//
//  Created by Shazia Vohra on 2023-11-30.
//

import Foundation
import FirebaseAuth

class AppViewModel: ObservableObject {
 
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
