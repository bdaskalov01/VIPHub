//
//  UserDetailsCacheProtocol.swift
//  VIPHub
//
//  Created by Eleanor on 3.09.24.
//

import Foundation

protocol UserDetailsCacheProtocol {
    
    func resetCache()
    
    func setArray(_ userDetails: UserDetails, forKey key: String)
    
    func getArray(forKey key: String) -> UserDetails?
    
    func removeArray(forKey key: String)
}
