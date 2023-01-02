//
//  AccountView.swift
//  Appetizers
//
//  Created by Samed Dağlı on 1.01.2023.
//

import SwiftUI

struct AccountView: View {
    @StateObject private var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First name", text: $viewModel.user.nameText)
                    TextField("Last name", text: $viewModel.user.lastNameText)
                    TextField("Email", text: $viewModel.user.emailText)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $viewModel.user.birthdayDate,
                               in: Date().hundredYearsAgo...Date().fifteenYearAgo,
                               displayedComponents: .date)
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save changes")
                    }

                } header: {
                    Text("Personal Information")
                }
                
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                } header: {
                    Text("Requests")
                }
                .toggleStyle(SwitchToggleStyle(tint: Color(.systemPink)))
            }
            .navigationTitle("Account")
            .alert(item: $viewModel.alertItem) { alert in
                Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
            }
        }
        .onAppear {
            viewModel.retrieveUser()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
