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
                    TextField("First name", text: $viewModel.nameText)
                    TextField("Last name", text: $viewModel.lastNameText)
                    TextField("Email", text: $viewModel.emailText)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $viewModel.birthdayDate, displayedComponents: .date)
                    Button {
                        print("Save changes")
                    } label: {
                        Text("Save changes")
                    }

                } header: {
                    Text("Personal Information")
                }
                
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.extraNapkins)
                } header: {
                    Text("Requests")
                }
                .toggleStyle(SwitchToggleStyle(tint: Color(.systemPink)))
            }
            .navigationTitle("Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
