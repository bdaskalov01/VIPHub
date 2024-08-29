//
//  ContentView.swift
//  VIPHub
//
//  Created by Eleanor on 20.08.24.
//

import SwiftUI

struct ContentView: View {

    
    var body: some View {
        NavigationView {
            
            UsersView()
            
        }
        
    }
    
    func UsersView() -> some View {
        let state: GlobalState = GlobalState().getInstance()
        let presenter = UsersPresenter()
        let interactor = UsersInteractor()
        let usersApiWorker = APIWorkerImpl()
        let usersApi = UsersAPIimpl()
        let usersRouter = UsersRouterImpl()
        
        usersRouter.state = state
        interactor.presenter = presenter
        interactor.router = usersRouter
        usersApi.state = state
        usersApiWorker.api = usersApi
        interactor.apiWorker = usersApiWorker
        let view = VIPHub.UsersView(interactor: interactor, state: state)
        
        presenter.view = view
        presenter.state = state
        return view
    }
    
    func DetailsView() -> some View {
        let state: GlobalState = GlobalState().getInstance()
        let presenter = DetailsPresenter()
        let interactor = DetailsInteractor()
        let detailsApiWorker = DetailsAPIWorkerImpl()
        let detailsApi = DetailsAPIimpl()
        
        interactor.presenter = presenter
        detailsApiWorker.api = detailsApi
        interactor.apiWorker = detailsApiWorker
        let view = VIPHub.DetailsView(interactor: interactor, state: state)
        
        presenter.view = view
        presenter.state = state
        return view
    }
}

//#Preview {
//    ContentView()
//}
