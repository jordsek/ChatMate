//
//  ChatViewModel.swift
//  ChatMate
//
//  Created by Jor . on 09/07/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
@MainActor

class ChatViewModel: ObservableObject {
    
    @Published var groups: [Group] = []
    @Published var chatMessages: [ChatMessage] = []
    
    var firestoreListener: ListenerRegistration?
    
    func updateDisplayName(user: User, displayName: String) async throws {
        let request = user.createProfileChangeRequest()
        request.displayName = displayName
        try await request.commitChanges()
    }
    
    func populateGroups() async throws {
        let db = Firestore.firestore()
        let snapshot = try await db.collection("groups").getDocuments()
        
        snapshot.documents.compactMap { snapshot in
            Group.fromSnapshot(snapshot: snapshot)
        }
    }
    
    func saveChatMessageToGroup(chatMessage: ChatMessage, group: Group) async throws {
        let db = Firestore.firestore()
                guard let groupDocumentId = group.documentId else {return }
                let _ = try await db.collection("groups")
                    .document(groupDocumentId)
                    .collection("messages")
                    .addDocument(data: chatMessage.toDictionary())
    }
    
//    func savechatMessageToGroup(text: String, group:Group, completion: @escaping (Error?) -> Void) {
//        let db = Firestore.firestore()
//        guard let groupDocumentId = group.documentId else {return }
//        db.collection("groups")
//            .document(groupDocumentId)
//            .collection("messages")
//            .addDocument(data: ["chatText": text]) { error in
//                completion(error)
//            }
//    }
    
    func saveGroup(group: Group, completion: @escaping (Error?) -> Void) {
        let db = Firestore.firestore()
        var docRef: DocumentReference? = nil
        docRef = db.collection("groups")
            .addDocument(data: group.toDictionary()){ [weak self] error in
                if error != nil {
                    completion(error)
                } else {
                    if let docRef {
                        var newGroup = group
                        newGroup.documentId = docRef.documentID
                        self?.groups.append(newGroup)
                        completion(nil)
                    } else {
                        completion(nil)
                    }
                }
               
            }
    }
    
    func listenForCHatMessages(in group: Group){
        
        let db = Firestore.firestore()
        chatMessages.removeAll()
        
        guard let doccumentID = group.documentId else {return }
        
        self.firestoreListener = db.collection("groups")
//            .document(documentId)
//            .collection("messages")
//            .order(by: <#T##String#>)
    }
}
