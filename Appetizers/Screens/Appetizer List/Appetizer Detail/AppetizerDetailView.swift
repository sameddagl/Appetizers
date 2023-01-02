//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Samed Dağlı on 1.01.2023.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @ObservedObject var viewModel: AppetizerDetailViewModel
    @EnvironmentObject var order: Order
    
    var body: some View {
        ZStack {
            VStack {
                AppetizerRemoteImage(url: viewModel.appetizer.imageURL)
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 300, maxHeight: 225)
                
                VStack(spacing: 5) {
                    Text(viewModel.appetizer.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(viewModel.appetizer.requestDescription)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    HStack(spacing: 20) {
                        DetailInfoView(name: "Calories", value: "\(viewModel.appetizer.calories)")
                        DetailInfoView(name: "Carbs", value: "\(viewModel.appetizer.carbs)g")
                        DetailInfoView(name: "Protein", value: "\(viewModel.appetizer.protein)g")
                    }
                }
                .padding()
                
                Spacer()
                
                Button {
                    order.add(viewModel.appetizer)
                    viewModel.isShowingDetail.wrappedValue = false
                } label: {
                    APButton(title: "$\(viewModel.appetizer.price, specifier: "%.2f") - Add to order")
                }
                .padding(.bottom, 30)
            }
            .frame(width: 300, height: 525, alignment: .center)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .overlay(
                Button(action: {
                    viewModel.isShowingDetail.wrappedValue = false
                }, label: {
                    XDismissButton()
                }), alignment: .topTrailing)
        }
        .shadow(radius: 50)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(viewModel: AppetizerDetailViewModel(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(false)))
    }
}

struct DetailInfoView: View {
    var name: String
    var value: String
    
    var body: some View {
        VStack {
            Text(name)
                .font(.callout)
                .fontWeight(.semibold)
            Text(value)
                .font(.callout)
                .foregroundColor(.secondary)
        }
    }
}
