//
//  ChatViewModel.swift
//  ChatMate
//
//  Created by Jor . on 09/07/2024.
//

import Foundation
import FirebaseAuth

@MainActor

class ChatViewModel: ObservableObject {
    
    func updateDisplayName(user: User, displayName: String) async throws {
        let request = user.createProfileChangeRequest()
        request.displayName = displayName
        try await request.commitChanges()
    }
}
