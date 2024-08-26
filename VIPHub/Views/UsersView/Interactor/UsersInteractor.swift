//
//  UsersInteractor.swift
//  VIPHub
//
//  Created by Eleanor on 20.08.24.
//

import Foundation

final class UsersInteractor: UsersInteractorProtocol {
    
    var worker: APIWorker?
    var presenter: UsersPresenterProtocol?
    
    
    func displayData(input: String) {
        presenter!.mapDisplayData(users: "input + \(input)")
    }
    
    func updateState() {
        
    }
    
}
