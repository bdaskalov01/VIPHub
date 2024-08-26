//
//  DetailsAPIimpl.swift
//  VIPHub
//
//  Created by Eleanor on 21.08.24.
//

import Foundation

final class DetailsAPIimpl: DetailsAPI {
    
    let API_URL = "https://api.github.com/user/"
    let API_TOKEN = "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"
    let cache: UserDetailsCache = UserDetailsCache()
    
    func fetchUserDetails(id: String) async throws  -> UserDetails{
        
        var userDetails: UserDetails
        
        if let cache = cache.getArray(forKey: id) {
            userDetails = cache
            return userDetails
        }
        
        let url = URL(string: "\(API_URL + id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(API_TOKEN)", forHTTPHeaderField: "Authorization")
        let (data, _) = try await URLSession.shared.data(for: request)
        userDetails = try JSONDecoder().decode(UserDetails.self, from: data)
        cache.setArray(userDetails, forKey: id)
        return userDetails
    }
    
}
