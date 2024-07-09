//
//  LoginView.swift
//  ChatMate
//
//  Created by Jor . on 09/07/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    private var isFormValid: Bool {
        !email.isEmptyOrWhiteSpace && !password.isEmptyOrWhiteSpace
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
