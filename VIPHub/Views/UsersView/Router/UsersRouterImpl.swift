//
//  UsersRouterImpl.swift
//  VIPHub
//
//  Created by Eleanor on 28.08.24.
//

import Foundation

final class UsersRouterImpl: UsersRouter {
    
    var state: GlobalState?
    
    @MainActor
    func navigateToDetails(id: String) {
        state?.setDetailsId(input: id)
        state?.navigate(input: .details)
    }
    
}
