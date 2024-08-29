//
//  DetailsAPIWorkerImpl.swift
//  VIPHub
//
//  Created by Eleanor on 28.08.24.
//

import Foundation

final class DetailsAPIWorkerImpl: DetailsAPIWorker {
    
    var api: DetailsAPI?
    
    func fetchDetails(id: String) async throws -> UserDetails {
        return try await api!.fetchUserDetails(id: id)
    }
    
}
