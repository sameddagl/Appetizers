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
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            withAnimation {
                                viewModel.isShowingDetail = true
                            }
                        }
                }
                .blur(radius: viewModel.isShowingDetail ? 10 : 0)
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetail)
                .navigationTitle("Appetizers")
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(viewModel: AppetizerDetailViewModel(appetizer: viewModel.selectedAppetizer!,
                                                                        isShowingDetail: $viewModel.isShowingDetail))
                .transition(.scale)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
