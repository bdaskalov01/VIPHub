//
//  State.swift
//  VIPHub
//
//  Created by Eleanor on 27.08.24.
//

import Foundation

class GlobalState: ObservableObject {
    
    static var shared: GlobalState = GlobalState()
    
    func getInstance() -> GlobalState {
        return GlobalState.shared
    }

    func newInstance() -> GlobalState{
        GlobalState.shared = GlobalState()
        return GlobalState.shared
    }
    
    enum Route {
        case users
        case details
    }
    
    @Published var isFetching: Bool = false
    @Published var isThereError: Bool = false
    @Published var isDetailsActive: Bool = false
    @Published var users: [User]?
    @Published var error: String?
    @Published var route: Route = .users
    @Published var details: UserDetails?
    @Published var detailsId: String?
    @Published var detailsWithLabels: [String]?
    
    @MainActor
    public func setUsers(input: [User]?) {
            GlobalState.shared.users = input
    }
    
    @MainActor
    public func setError(input: String) {
            GlobalState.shared.error = input
    }
    
    @MainActor
    public func setDetails(input: UserDetails?) {
            GlobalState.shared.details = input
    }
    
    @MainActor
    public func setDetailsId(input: String) {
            GlobalState.shared.detailsId = input
    }
    
    @MainActor
    public func setDetailsWithLabel(input: [String]) {
            GlobalState.shared.detailsWithLabels = input
    }
    
    @MainActor
    public func setIsFetchingFun(input: Bool) {
            GlobalState.shared.isFetching = input
    }
    
    @MainActor
    public func setIsThereError(input: Bool) {
            GlobalState.shared.isThereError = input
    }
    
    @MainActor
    public func setIsDetailsActive(input: Bool) {
            GlobalState.shared.isDetailsActive = input
    }
    
    @MainActor
    public func navigate(input: Route) {
            GlobalState.shared.route = input
    }
    
}
