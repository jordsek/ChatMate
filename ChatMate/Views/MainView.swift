//
//  MainView.swift
//  ChatMate
//
//  Created by Jor . on 10/07/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            GroupListContainerView()
                .tabItem {
                    Label("Chats", systemImage: "message.fill")
                }
            
            Text("Settings")
                .tabItem {
                    Label("Seting", systemImage: "gear")
                }
        }
    }
}

#Preview {
    MainView()
}
