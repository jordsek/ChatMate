//
//  GroupListContainerView.swift
//  ChatMate
//
//  Created by Jor . on 10/07/2024.
//

import SwiftUI

struct GroupListContainerView: View {
    @EnvironmentObject private var chatVM: ChatViewModel
    @State private var isPresented: Bool = false
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button("New Group"){
                    isPresented = true
                }
            }
            GroupListView(groups: chatVM.groups)
            Spacer()
        }
        .task {
            do{
                try await chatVM.populateGroups()
            }catch {
                print(error)
            }
        }
        .padding()
            .sheet(isPresented: $isPresented){
                AddNewGroupView()
            }
    }
}

#Preview {
    GroupListContainerView()
        .environmentObject(ChatViewModel())
}
