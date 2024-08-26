//
//  UsersPresenter.swift
//  VIPHub
//
//  Created by Eleanor on 20.08.24.
//

import Foundation

final class UsersPresenter: UsersPresenterProtocol {
    
    var view: UsersViewProtocol?
    
    func mapDisplayData(users: String) {
        view!.displayData(users: users)
    }
    
}
