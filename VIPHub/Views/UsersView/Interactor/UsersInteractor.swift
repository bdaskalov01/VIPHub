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
            let result = try await self.apiWorker?.fetchData(input: input)
            presenter!.changeFetching(input: false)
            presenter!.mapUsers(users: result!)
        }
    }
    
    func changeDetailsId(id: String) {
        presenter!.changeDetailsId(id: id)
    }
    
}
