//
//  LoginView.swift
//  ChatMate
//
//  Created by Jor . on 09/07/2024.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    private var isFormValid: Bool {
        !email.isEmptyOrWhiteSpace && !password.isEmptyOrWhiteSpace
    }
    
    private func login() async {
        do {
          _ =  try await  Auth.auth().signIn(withEmail: email, password: password)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
                .textInputAutocapitalization(.never)
            
            HStack {
                Spacer()
                 Button("Login"){
                    Task{
                       
                    }
                }.disabled(!isFormValid)
                    .buttonStyle(.borderless)
                
                Button("Register"){
                    
                }.buttonStyle(.borderless)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
