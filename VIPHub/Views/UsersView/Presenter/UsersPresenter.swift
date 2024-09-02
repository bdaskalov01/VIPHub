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
    
    func mapUsers(users: [User]) {
        state.setUsers(input: users)
    }
    
    func changeDetailsId(id: String) {
        state.setDetailsId(input: id)
    }
    
    func changeFetching(input: Bool) {
        state.setIsFetchingFun(input: input)
    }

    
    
}
