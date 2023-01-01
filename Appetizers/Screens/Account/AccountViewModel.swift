//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Samed Dağlı on 1.01.2023.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @Published var nameText = ""
    @Published var lastNameText = ""
    @Published var emailText = ""
    @Published var birthdayDate = Date()
    @Published var extraNapkins = false
    
    @Published var alertItem: AlertItem?
    
    func saveChanges() {
        guard isValidForm() == true else { return }
    }
    
    func isValidForm() -> Bool{
        guard !nameText.isEmpty, !lastNameText.isEmpty, !emailText.isEmpty else {
            alertItem = AlertContext.emptyForm
            return false
        }
        
        guard emailText.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        alertItem = AlertContext.successfullySaved
        return true
    }
}
