//
//  UsersCache.swift
//  VIPHub
//
//  Created by Eleanor on 21.08.24.
//

import Foundation

class UsersCache {

    static let cache = NSCache<NSString, UserWrapper>()
    static let lastPage = NSCache<NSString, NSNumber>()
    static let totalCount = NSCache<NSString, NSNumber>()


    func setArray(_ user: [User], forKey key: String) {
        let wrapper = UserWrapper(user: user)
        UsersCache.cache.setObject(wrapper, forKey: key as NSString)
    }


    func getArray(forKey key: String) -> [User]? {
        return UsersCache.cache.object(forKey: key as NSString)?.user as? [User]
    }

    func removeArray(forKey key: String) {
        UsersCache.cache.removeObject(forKey: key as NSString)
    }
    
    func setLastPage(lastPage: NSNumber, forKey key: String) {
        UsersCache.lastPage.setObject(lastPage as NSNumber, forKey: key as NSString)
    }


    func getLastPage(forKey key: String) -> Int? {
        return UsersCache.lastPage.object(forKey: key as NSString) as? Int
    }

    func removeLastPage(forKey key: String) {
        UsersCache.lastPage.removeObject(forKey: key as NSString)
    }
    
    func setTotalCount(totalCount: NSNumber, forKey key: String) {
        UsersCache.totalCount.setObject(totalCount as NSNumber, forKey: key as NSString)
    }


    func getTotalCount(forKey key: String) -> Int? {
        return UsersCache.totalCount.object(forKey: key as NSString) as? Int
    }

    func removeTotalCount(forKey key: String) {
        UsersCache.totalCount.removeObject(forKey: key as NSString)
    }
}
