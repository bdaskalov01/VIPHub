//
//  User.swift
//  VIPHub
//
//  Created by Eleanor on 21.08.24.
//

import Foundation

struct User: Decodable, Equatable, Identifiable {
    let login: String
    let avatar_url: String
    let id: Int
    
    init(login: String, avatar_url: String, id: Int) {
        self.login = login
        self.avatar_url = avatar_url
        self.id = id
    }
}

class UserWrapper: NSObject {
    let user: [User]
    
    init(user: [User]) {
            self.user = user
        }
}
