//
//  SignupView.swift
//  ChatMate
//
//  Created by Jor . on 09/07/2024.
//

import SwiftUI
import FirebaseAuth

struct SignupView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var displayName: String = ""
    
    @EnvironmentObject private var chatVm: ChatViewModel
    @EnvironmentObject private var appState: AppState
    
    private var isFormValid: Bool {
        !email.isEmptyOrWhiteSpace && !password.isEmptyOrWhiteSpace && !displayName.isEmptyOrWhiteSpace
    }
    
    private func signUp() async {
        
        do {
            let result = try await  Auth.auth().createUser(withEmail: email, password: password)
            try await chatVm.updateDisplayName(user: result.user, displayName: displayName)
            appState.routes.append(.login)
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
                .textInputAutocapitalization(.never)
            TextField("Display name", text: $displayName)
            
            HStack {
                Spacer()
                Button("SignUp"){
                    Task{
                        signUp
                    }
                }.disabled(!isFormValid)
                    .buttonStyle(.borderless)
                
                Button("Login"){
                    appState.routes.append(.login)
                }.buttonStyle(.borderless)
                Spacer()
            }
        }
    }
}

#Preview {
    SignupView().environmentObject(ChatViewModel())
        .environmentObject(AppState())
       
}
