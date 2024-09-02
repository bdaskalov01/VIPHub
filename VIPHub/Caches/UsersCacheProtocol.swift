//
//  UsersCacheProtocol.swift
//  VIPHub
//
//  Created by Eleanor on 3.09.24.
//

import Foundation

protocol UsersCacheProtocol {
    
    func resetCache()
    
    func getCount() -> Int
    
    func setArray(_ user: [User], forKey key: String)
    
    func getArray(forKey key: String) -> [User]?
    
    func removeArray(forKey key: String)
    
    func setLastPage(lastPage: NSNumber, forKey key: String)
    
    func getLastPage(forKey key: String) -> Int?
    
    func removeLastPage(forKey key: String)
    
    func setTotalCount(totalCount: NSNumber, forKey key: String)


    func getTotalCount(forKey key: String) -> Int?

    func removeTotalCount(forKey key: String)

}
