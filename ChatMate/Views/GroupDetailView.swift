//
//  GroupDetailView.swift
//  ChatMate
//
//  Created by Jor . on 16/07/2024.
//

import SwiftUI
import FirebaseAuth
struct GroupDetailView: View {
    @EnvironmentObject var vmChat: ChatViewModel
    let group: Group
    @State private var chatText: String = ""
    
    private func sendMessage() async throws {
        
        guard let currentUser = Auth.auth().currentUser else {return }
        let chatMessage = ChatMessage(text: chatText, uid: currentUser.uid, displayName: currentUser.displayName ?? "Guest")
        
        try await vmChat.saveChatMessageToGroup(chatMessage: chatMessage, group: group)
    }
    var body: some View {
        VStack {
            Spacer()
            TextField("Enter chat message", text: $chatText)
            Button("Send"){
                Task{
                    do {
                        try await sendMessage()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }.padding()
    }
}

#Preview {
    GroupDetailView(group: Group(subject: "Gym"))
        .environmentObject(ChatViewModel())
}
