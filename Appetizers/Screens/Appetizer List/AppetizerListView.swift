//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Samed Dağlı on 1.01.2023.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject private var viewModel = AppetizerListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
                .navigationTitle("Appetizers")
                .alert(item: $viewModel.alertItem) { alert in
                    Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
                }
                
                if viewModel.isLoading {
                    LoadingView()
                }
            }
        }
        .onAppear {
            viewModel.getAppetizers()
        }
    }
    

}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
