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
            let result = try await self.apiWorker?.fetchData(input: input)
            presenter?.mapUsers(users: result!)
        }
    }
    
    func navigateToDetails(id: String) {
        router?.navigateToDetails(id: id)
    }
    
}
