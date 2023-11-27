//
//  JacketECommerceStoreApp.swift
//  JacketECommerceStore
//
//  Created by Shazia Vohra on 2023-11-17.
//

import SwiftUI
import Firebase

@main
struct IOAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            HomeView()
                .environmentObject(viewModel)
			// maybe using a single viewmodel for the whole application might complicate things in the future, also, if you're using environment objects, be completely sure that they're passed through the hierarchy of views, otherwise you may face runtime crashes.
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
