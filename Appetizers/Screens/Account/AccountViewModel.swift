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
    
}
