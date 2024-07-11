//
//  AddNewGroupView.swift
//  ChatMate
//
//  Created by Jor . on 10/07/2024.
//

import SwiftUI

struct AddNewGroupView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var groupSubject: String = ""
    
    private var isFormValid: Bool {
        !groupSubject.isEmptyOrWhiteSpace
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Group Subject", text: $groupSubject)
                }
                Spacer()
            }.padding()
                .toolbar {
                    ToolbarItem(placement: .principal){
                        Text("New Group")
                            .bold()
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading){
                        Button("Cancel"){
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("Create"){
                            
                        }.disabled(!isFormValid)
                    }
                }
        }
    }
}

#Preview {
    NavigationStack{
        AddNewGroupView()
    }
}
