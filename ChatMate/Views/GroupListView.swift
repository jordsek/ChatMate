//
//  GroupListView.swift
//  ChatMate
//
//  Created by Jor . on 11/07/2024.
//

import SwiftUI

 struct GroupListView: View {
    
    let groups: [Group]
    var body: some View {
        List(groups) { group in
            NavigationLink {
                GroupDetailView(group: group)
            } label: {
                Image(systemName: "person.2")
                Text(group.subject)
            }
            
        }
    }
}

#Preview {
    GroupListView(groups: [])
}
