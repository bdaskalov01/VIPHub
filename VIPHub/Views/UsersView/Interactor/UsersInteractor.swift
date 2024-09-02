//
//  UsersInteractor.swift
//  VIPHub
//
//  Created by Eleanor on 20.08.24.
//

import Foundation

final class UsersInteractor: UsersInteractorProtocol {
    
    var apiWorker: APIWorker?
    var presenter: UsersPresenterProtocol?
    var router: UsersRouter?
    
    
    func displayData(input: String) {
        Task {
            presenter!.changeFetching(input: true)
            var result: [User]
            var error: String
            (result, error) = try await (self.apiWorker?.fetchData(input: input) as? ([User], String))!
            presenter!.changeFetching(input: false)
            presenter!.mapUsers(users: result)
            presenter!.changeError(input: error)
            
        }
    }
    
    func changeDetailsId(id: String) {
        presenter!.changeDetailsId(id: id)
    }
    
}
