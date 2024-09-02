//
//  UsersPresenterProtocol.swift
//  VIPHub
//
//  Created by Eleanor on 20.08.24.
//

import Foundation

protocol UsersPresenterProtocol {
    
    func mapUsers(users: [User])
    
    func changeDetailsId(id: String) 
    
    func changeFetching(input: Bool)
    
    func changeError(input: String)
    
}
