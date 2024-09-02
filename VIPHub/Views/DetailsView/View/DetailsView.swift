//
//  DetailsView.swift
//  VIPHub
//
//  Created by Eleanor on 21.08.24.
//

import Foundation

import SwiftUI

struct DetailsView: View {
    
    var interactor: DetailsInteractorProtocol?
    @ObservedObject var globalState: GlobalState = GlobalState().getInstance()
    var id: String = ""
    
    var body: some View {
        VStack {
            List {
                VStack {
                    HStack {
                        Spacer()
                        if let details = globalState.details {
                            AsyncImage(url: URL(string: details.avatar_url)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView() // Show a loading indicator
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 200, height: 200)
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
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        if let details = globalState.details {
                            Text(details.login)
                                .fontWeight(.medium)
                                .padding()
                        }
                        Spacer()
                    }
                }
                
                if let detailsWithLabel = globalState.detailsWithLabels {
                    ForEach(detailsWithLabel, id: \.self) { item in
                        Text(item)
                    }
                }
                
            }
            .listStyle(.plain)
           
        }
        .onAppear {
            Task { @MainActor in
                try await interactor!.displayUserDetails(id: globalState.detailsId!)
            }
        }
    }
}

extension DetailsView: DetailsViewProtocol {
    
}

//
//#Preview {
//    DetailsView()
//}
