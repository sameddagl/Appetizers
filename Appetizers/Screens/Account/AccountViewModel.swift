//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Samed Dağlı on 1.01.2023.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    func saveChanges() {
        guard isValidForm() == true else { return }
        
        do {
            let decodedData = try JSONEncoder().encode(user)
            userData = decodedData
            alertItem = AlertContext.successfullySaved
        } catch {
            print(error)
        }
    }
    
    func retrieveUser() {
        do {
            guard let userData = userData else { return }
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            print(error)
        }
    }
    
    func isValidForm() -> Bool{
        guard !user.nameText.isEmpty, !user.lastNameText.isEmpty, !user.emailText.isEmpty else {
            alertItem = AlertContext.emptyForm
            return false
        }
        
        guard user.emailText.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
}
