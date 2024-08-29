//
//  UserView.swift
//  VIPHub
//
//  Created by Eleanor on 20.08.24.
//

import SwiftUI

struct UsersView: View {
    
    let interactor: UsersInteractorProtocol?
    @ObservedObject var state: GlobalState
    
    @State private var searchText: String = ""
    @State private var isAtBottom: Bool = false
    @State private var isThereAnError: Bool = false
    @State private var query: String = ""
    
    var body: some View {
                ZStack {
                        listOfUsers()
                
                    .navigationTitle("Items")
                    .onChange(of: searchText) { newValue in
                                        query = newValue
                        print("9hfu92hfuhfuhfuhfui")
                        interactor?.displayData(input: query)
                                }
                    .onChange(of: isAtBottom) { value in
                        if value {
                            interactor?.displayData(input: query)
                            isAtBottom = false
                        }
                    }
                
                    .onChange(of: state.isThereError) { value in
                        if value {
                            isThereAnError = true
                        }
                        else {
                            isThereAnError = false
                        }
                    }
                
                    // Overlay the ProgressView on top of the content
                    if state.isFetching {
                        ProgressView("Loading...")
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(1.5)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.black.opacity(0.4).edgesIgnoringSafeArea(.all))
                    }
                    
                    
                }
            .alert(state.error, isPresented: $isThereAnError) {
                    Button(role: .none) {
                        // presenter?.setIsThereError(input: false)
                    } label: {
                        Text("OK")
                    }
                }
        
        
               
        
        }
    
    @ViewBuilder func listOfUsers() -> some View {
        VStack {
            List(state.users) { item in
                HStack {

                        if let imageUrl = URL(string: item.avatar_url) {
                            AsyncImage(url: imageUrl) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView() // Show a loading indicator
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 50, height: 50)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                case .failure:
                                    Image(systemName: "exclamationmark.triangle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 50, height: 50)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            
                        }
                        Text(item.login)
                            .onAppear {
                                if item == state.users.last {
                                    isAtBottom = true
                                    print("Scrolled to bottom")
                                }
                            }
                        
                    }
                .onTapGesture {
                    interactor?.navigateToDetails(id: String(item.id))
                }
                }
                
            }
            .searchable(text: $query, prompt: "Search items")
            .onSubmit(of: .search) {
                self.searchText = query
                print(query)
                }
            .disabled(state.isFetching)
    }
    }


extension UsersView: UsersViewProtocol {
    
}

//#Preview {
///    UsersView()
//}
