//
//  UsersAPI.swift
//  VIPHub
//
//  Created by Eleanor on 21.08.24.
//

import Foundation

protocol UsersAPI {
    
    func fetchUsers(input: String) async throws -> [User]
    
}

