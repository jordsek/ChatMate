//
//  ChatMessage.swift
//  ChatMate
//
//  Created by Jor . on 16/07/2024.
//

import Foundation

struct ChatMessage: Codable, Identifiable, Equatable {
    
    var documentId: String?
    let text: String
    let uid: String
    var dateCreated = Date()
    let displayName: String
    
    var id: String{
        documentId ?? UUID().uuidString
    }
}

extension ChatMessage {
    func toDictionary() -> [String: Any]{
        return [
            "test": text,
            "uid": uid,
            "dateCreated": dateCreated,
            "displayName": displayName
        ]
    }
}
