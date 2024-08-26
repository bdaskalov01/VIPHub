//
//  APIWorker.swift
//  VIPHub
//
//  Created by Eleanor on 21.08.24.
//

import Foundation

final class APIWorkerImpl: APIWorker, ObservableObject {
    
    var api: UsersAPI?
    
    func fetchData(input: String) async throws -> [User] {
        guard let users = try await api?.fetchUsers(input: input) else {return []}
        return users
    }
    
}
