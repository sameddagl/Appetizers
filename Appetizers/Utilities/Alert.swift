//
//  Alert.swift
//  Appetizers
//
//  Created by Samed Dağlı on 1.01.2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                         message: Text("Please check your internet connection."),
                                         dismissButton: .default(Text("Okay")))
    
    static let unableToComplete = AlertItem(title: Text("Unable to complete"),
                                         message: Text("Unable to complete your request. Please check your internet connection."),
                                         dismissButton: .default(Text("Okay")))
    
    static let invalidResponse = AlertItem(title: Text("Invalid Response"),
                                         message: Text("Invalid response from the server. Please try again."),
                                         dismissButton: .default(Text("Okay")))
    
    static let invalidData = AlertItem(title: Text("Invalid Data"),
                                         message: Text("The data received from the server was invalid. Please try again."),
                                         dismissButton: .default(Text("Okay")))
    
    static let emptyForm = AlertItem(title: Text("Invalid Form"),
                                     message: Text("Please fill up all the informations."),
                                     dismissButton: .default(Text("Okay")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                     message: Text("Please ensure your email adress is correct."),
                                     dismissButton: .default(Text("Okay")))
    
    static let successfullySaved = AlertItem(title: Text("Successfully Saved"),
                                     message: Text("Your informations was successfully saved."),
                                     dismissButton: .default(Text("Okay")))
}
