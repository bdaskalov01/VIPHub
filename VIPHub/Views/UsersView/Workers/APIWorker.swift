//
//  APIWorker.swift
//  VIPHub
//
//  Created by Eleanor on 21.08.24.
//

import Foundation

protocol APIWorker {
    
    func fetchData(input: String) async throws -> [User]
}
