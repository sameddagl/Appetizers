//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Samed Dağlı on 1.01.2023.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(url: appetizer.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 300, maxHeight: 225)
            
            VStack(spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.requestDescription)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack(spacing: 20) {
                    DetailInfoView(name: "Calories", value: "\(appetizer.calories)")
                    DetailInfoView(name: "Carbs", value: "\(appetizer.carbs)g")
                    DetailInfoView(name: "Protein", value: "\(appetizer.protein)g")
                }
            }
            .padding()
            
            Spacer()
            
            Button {
                
            } label: {
                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525, alignment: .center)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .overlay(
            Button(action: {
                isShowingDetail = false
            }, label: {
                XDismissButton()
            }), alignment: .topTrailing)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(false))
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
