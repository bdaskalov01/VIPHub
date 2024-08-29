//
//  DetailsAPIWorker.swift
//  VIPHub
//
//  Created by Eleanor on 28.08.24.
//

import Foundation

protocol DetailsAPIWorker {
    
    func fetchDetails(id: String) async throws -> UserDetails
    
}
