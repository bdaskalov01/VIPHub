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
        let presenter = UsersPresenter()
        let interactor = UsersInteractor()
        let usersApiWorker = APIWorkerImpl()
        let usersApi = UsersAPIimpl()
        let usersRouter = UsersRouterImpl()
        interactor.presenter = presenter
        interactor.router = usersRouter
        usersApiWorker.api = usersApi
        interactor.apiWorker = usersApiWorker
        let view = VIPHub.UsersView(interactor: interactor)
        
        presenter.view = view
        return view
    }
    
}

//#Preview {
//    ContentView()
//}
