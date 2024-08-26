//
//  UserDetailsCache.swift
//  VIPHub
//
//  Created by Eleanor on 21.08.24.
//

import Foundation

class UserDetailsCache {

    static let cache = NSCache<NSString, UserDetailsWrapper>()

    
    func setArray(_ userDetails: UserDetails, forKey key: String) {
        let wrapper = UserDetailsWrapper(userDetails: userDetails)
        UserDetailsCache.cache.setObject(wrapper, forKey: key as NSString)
    }

    func getArray(forKey key: String) -> UserDetails? {
        return UserDetailsCache.cache.object(forKey: key as NSString)?.userDetails as? UserDetails
    }

    func removeArray(forKey key: String) {
        UserDetailsCache.cache.removeObject(forKey: key as NSString)
    }
}
