//
//  ChatMateApp.swift
//  ChatMate
//
//  Created by Jor . on 09/07/2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
  
}
@main
struct ChatMateApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var chatVM = ChatViewModel()
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
    
            NavigationStack(path: $appState.routes) {
                ZStack {
                    if Auth.auth().currentUser != nil {
                        MainView()
                    }else {
                        LoginView()
                    }
                }.navigationDestination(for: Route.self){ route in
                    switch route {
                    case .main:
                        MainView()
                    case .login:
                        LoginView()
                    case .signUp:
                        SignupView()
                    }
                }
            }.environmentObject(chatVM)
            .environmentObject(appState)
        }
    }
}
