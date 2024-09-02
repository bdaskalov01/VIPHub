//
//  UsersPresenter.swift
//  VIPHub
//
//  Created by Eleanor on 20.08.24.
//

import Foundation

final class UsersPresenter: UsersPresenterProtocol {
    
    var view: UsersViewProtocol?
    var state: GlobalState = GlobalState().getInstance()
    
    @MainActor
    func mapUsers(users: [User]) {
        state.setUsers(input: users)
    }
    
    @MainActor
    func changeDetailsId(id: String) {
        state.setDetailsId(input: id)
    }
    
    @MainActor
    func changeFetching(input: Bool) {
        state.setIsFetchingFun(input: input)
    }

    @MainActor
    func changeError(input: String) {
        if (input != "" ) {
            state.setIsThereError(input: true)
            state.setError(input: input)
        }
    }
    
}
