//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Samed Dağlı on 1.01.2023.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers = [Appetizer]()
    @Published var alertItem: AlertItem?
    
    @Published var isLoading = false
    
    @Published var isShowingDetail: Bool = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    self.handleError(error: error)
                }
            }
        }
    }
    
    private func handleError(error: NetworkError) {
        switch error {
        case .invalidURL:
            alertItem = AlertContext.invalidURL
        case .unableToComplete:
            alertItem = AlertContext.unableToComplete
        case .invalidResponse:
            alertItem = AlertContext.invalidResponse
        case .invalidData:
            alertItem = AlertContext.invalidData
        }
    }
}
