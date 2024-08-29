//
//  DetailsInteractor.swift
//  VIPHub
//
//  Created by Eleanor on 21.08.24.
//

import Foundation

final class DetailsInteractor: DetailsInteractorProtocol {
    
    var presenter: DetailsPresenterProtocol?
    var apiWorker: DetailsAPIWorker?
    
    func displayUserDetails(id: String) {
        Task {
            let details = try await apiWorker!.fetchDetails(id: id)
            presenter!.updateDetails(details: details)
        }
    }
}
