//
//  APIWorker.swift
//  VIPHub
//
//  Created by Eleanor on 21.08.24.
//

import Foundation

final class APIWorkerImpl: APIWorker, ObservableObject {
    
    var api: UsersAPI?
    
    func fetchData(input: String) async throws -> ([User], String) {
        let (users, error) = try await (api?.fetchUsers(input: input) as? ([User], String))!
        return (users, error)
    }
    
}
