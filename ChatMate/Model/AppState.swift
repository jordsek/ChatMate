//
//  AppState.swift
//  ChatMate
//
//  Created by Jor . on 10/07/2024.
//

import Foundation

enum Route: Hashable {
    case main
    case login
    case signUp
}
class AppState: ObservableObject {
    @Published var routes: [Route] = []
}
