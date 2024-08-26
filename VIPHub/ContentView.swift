//
//  ContentView.swift
//  VIPHub
//
//  Created by Eleanor on 20.08.24.
//

import SwiftUI

struct ContentView: View {
    let presenter = UsersPresenter()
    let interactor = UsersInteractor()
    
    var body: some View {
        
        interactor.presenter = self.presenter
        let view = UsersView(interactor: self.interactor, textToDisplay: "")
        
        presenter.view = view
        return view
    }
}

#Preview {
    ContentView()
}
