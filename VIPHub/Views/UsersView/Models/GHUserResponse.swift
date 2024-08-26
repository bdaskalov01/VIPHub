//
//  GHUserResponse.swift
//  VIPHub
//
//  Created by Eleanor on 21.08.24.
//

import Foundation

struct GHUserResponse: Decodable {
    let total_count: Int
    let incomplete_results: Bool
    let items: [User]
}
