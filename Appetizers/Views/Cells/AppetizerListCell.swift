//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Samed Dağlı on 1.01.2023.
//

import SwiftUI

struct AppetizerListCell: View {
    var appetizer: Appetizer
    
    var body: some View {
        HStack {
            AppetizerRemoteImage(url: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text("$\(appetizer.price ,specifier: "%.2f")")
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

struct AppetizerListCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListCell(appetizer: MockData.sampleAppetizer)
    }
}
