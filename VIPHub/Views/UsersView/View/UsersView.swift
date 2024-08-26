//
//  UserView.swift
//  VIPHub
//
//  Created by Eleanor on 20.08.24.
//

import SwiftUI

struct UsersView: View {
    
    let interactor: UsersInteractorProtocol?
    @State var textToDisplay: String
    
    var body: some View {
        VStack {
            Text(textToDisplay)
            Button("Button") {
                Task {
                    interactor!.displayData(input: "KUR")
                }
//                Task {
//                    textToDisplay += "1"
//                }
            }
                
        }
    }
}

extension UsersView: UsersViewProtocol {
    
    @MainActor
    func displayData(users: String) {
            print("Before: \(textToDisplay)")
            self.textToDisplay = users
            print("After: \(textToDisplay)")

    }
    
}

//#Preview {
///    UsersView()
//}
