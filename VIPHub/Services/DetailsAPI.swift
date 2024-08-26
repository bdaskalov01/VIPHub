//
//  DetailsAPI.swift
//  VIPHub
//
//  Created by Eleanor on 21.08.24.
//

import Foundation

protocol DetailsAPI {
    
    func fetchUserDetails(id: String) async throws -> UserDetails
    
}
