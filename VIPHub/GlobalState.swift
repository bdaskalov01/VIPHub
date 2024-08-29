//
//  State.swift
//  VIPHub
//
//  Created by Eleanor on 27.08.24.
//

import Foundation

class GlobalState: ObservableObject {
    
    private static let shared: GlobalState = GlobalState()
    
    func getInstance() -> GlobalState {
        return GlobalState.shared
    }
    
    enum Route {
        case users
        case details
    }
    
    @Published var isFetching: Bool = false
    @Published var isThereError: Bool = false
    @Published var isDetailsActive: Bool = false
    @Published var users: [User] = []
    @Published var error: String = ""
    @Published var route: Route = .users
    @Published var details: UserDetails = UserDetails()
    @Published var detailsId: String = ""
    @Published var detailsWithLabels: [String] = []
    
    public func setUsers(input: [User]) {
        DispatchQueue.main.async {
            GlobalState.shared.users = input
        }
    }
    
    public func setDetails(input: UserDetails) {
        DispatchQueue.main.async {
            GlobalState.shared.details = input
        }
    }
    
    public func setDetailsId(input: String) {
        DispatchQueue.main.async {
            GlobalState.shared.detailsId = input
        }
    }
    
    public func setDetailsWithLabel(input: [String]) {
        DispatchQueue.main.async {
            GlobalState.shared.detailsWithLabels = input
        }
    }
    
    public func setIsFetchingFun(input: Bool) {
        DispatchQueue.main.async {
            GlobalState.shared.isFetching = input
        }
    }
    
    public func setIsDetailsActive(input: Bool) {
        DispatchQueue.main.async {
            GlobalState.shared.isDetailsActive = input
        }
    }
    
    public func navigate(input: Route) {
        DispatchQueue.main.async {
            GlobalState.shared.route = input
        }
    }
    
}
