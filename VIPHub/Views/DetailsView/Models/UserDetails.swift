//
//  UserDetails.swift
//  VIPHub
//
//  Created by Eleanor on 21.08.24.
//

import Foundation

struct UserDetails: Decodable {
    
    var login: String = ""
    var id: Int = 0
    var node_id: String = ""
    var avatar_url: String = ""
    var gravatar_id: String = ""
    var url: String = ""
    var html_url: String = ""
    var followers_url: String = ""
    var following_url: String = ""
    var gists_url: String = ""
    var starred_url: String = ""
    var subscriptions_url: String = ""
    var organizations_url: String = ""
    var repos_url: String = ""
    var events_url: String = ""
    var received_events_url: String = ""
    var type: String = ""
    var site_admin: Bool = false
    var name: String? = ""
    var location: String? = ""
    var twitter_username: String? = ""
    var public_repos: Int = 0
    var public_gists: Int = 0
    var followers: Int = 0
    var following: Int = 0
    var created_at: String = ""
    var updated_at: String = ""
}

class UserDetailsWrapper: NSObject {
    let userDetails: UserDetails
    init (userDetails: UserDetails) {
        self.userDetails = userDetails
    }
}

extension UserDetails {
    func modeltoArray() -> [Any?] {
         let mirror = Mirror(reflecting: self)
         var tempArray = [String]()
            
        for (label,value) in mirror.children {
            if let label = label {
                tempArray.append("\(label) : \(value)")
            }
        }
        return tempArray
    }
}
