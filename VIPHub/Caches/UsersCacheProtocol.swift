//
//  UsersCacheProtocol.swift
//  VIPHub
//
//  Created by Eleanor on 27.08.24.
//

import Foundation

protocol UsersCacheProtocol {
    
    func setArray(_ user: [User], forKey key: String)


    func getArray(forKey key: String) -> [User]?

    func removeArray(forKey key: String)
    
    func setLastPage(lastPage: NSNumber, forKey key: String)

    func getLastPage(forKey key: String) -> Int?

    func removeLastPage(forKey key: String) 
}
