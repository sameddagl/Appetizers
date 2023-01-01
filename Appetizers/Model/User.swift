//
//  User.swift
//  Appetizers
//
//  Created by Samed Dağlı on 1.01.2023.
//

import Foundation

struct User: Codable {
    var nameText = ""
    var lastNameText = ""
    var emailText = ""
    var birthdayDate = Date()
    var extraNapkins = false
}
