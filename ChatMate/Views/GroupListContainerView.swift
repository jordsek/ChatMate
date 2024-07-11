//
//  GroupListContainerView.swift
//  ChatMate
//
//  Created by Jor . on 10/07/2024.
//

import SwiftUI

struct GroupListContainerView: View {
    
    @State private var isPresented: Bool = false
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button("New Group"){
                    isPresented = true
                }
            }
            Spacer()
        }.padding()
            .sheet(isPresented: $isPresented){
                AddNewGroupView()
            }
    }
}

#Preview {
    GroupListContainerView()
}
