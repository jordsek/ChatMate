//
//  Strings+Extensions.swift
//  ChatMate
//
//  Created by Jor . on 09/07/2024.
//

import Foundation

extension String {
    var isEmptyOrWhiteSpace: Bool{
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
