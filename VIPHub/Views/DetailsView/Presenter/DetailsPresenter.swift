//
//  DetailsPresenter.swift
//  VIPHub
//
//  Created by Eleanor on 21.08.24.
//

import Foundation

final class DetailsPresenter: DetailsPresenterProtocol {
    
    var view: DetailsViewProtocol?
    var globalState: GlobalState = GlobalState().getInstance()
    
    func updateDetails(details: UserDetails) {
        Task {
            self.globalState.setDetails(input: details)
            let detailsWithLabel = {
                details.modeltoArray().compactMap { item in
                        if let stringItem = item as? String {
                            return stringItem
                        } else if let intItem = item as? Int {
                            return "\(intItem)"
                        } else if let intItem = item as? Bool {
                            return "\(intItem)"
                        } else {
                            return ""
                        }
                    }
            }()

            self.globalState.setDetailsWithLabel(input: detailsWithLabel)
        }
    }
    
}
