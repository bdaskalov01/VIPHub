//
//  DetailsPresenter.swift
//  VIPHub
//
//  Created by Eleanor on 21.08.24.
//

import Foundation

final class DetailsPresenter: DetailsPresenterProtocol {
    
    var view: DetailsViewProtocol?
    var state: GlobalState?
    
    func updateDetails(details: UserDetails) {
        Task {
            await state!.setDetails(input: details)
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

            await state?.setDetailsWithLabel(input: detailsWithLabel)
        }
    }
    
}
