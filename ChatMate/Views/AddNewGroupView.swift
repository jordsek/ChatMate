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
    @EnvironmentObject private var chatVm: ChatViewModel
    
    private var isFormValid: Bool {
        !groupSubject.isEmptyOrWhiteSpace
    }
    
    private func saveGroup(){
        let group = Group(subject: groupSubject)
        chatVm.saveGroup(group: group) { error in
            if let error {
                print(error.localizedDescription)
            }
            dismiss()
        }
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
                            saveGroup()
                        }.disabled(!isFormValid)
                    }
                }
        }
    }
}

#Preview {
    NavigationStack{
        AddNewGroupView()
            .environmentObject(ChatViewModel())
    }
}
