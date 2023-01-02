//
//  OrderListCell.swift
//  Appetizers
//
//  Created by Samed Dağlı on 1.01.2023.
//

import SwiftUI

struct OrderListCell: View {
    var appetizer: Appetizer
    @State var orderCount = 0
    
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
                    .minimumScaleFactor(0.7)
                Text("$\(appetizer.price ,specifier: "%.2f")")
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
            
            Spacer()
            
            VStack {
                Text("\(orderCount)")
                Stepper("", value: $orderCount)
                    .scaleEffect(0.7)
                    .labelsHidden()
            }
            .padding(.trailing)
        }
    }
}

struct OrderListCell_Previews: PreviewProvider {
    static var previews: some View {
        OrderListCell(appetizer: MockData.sampleAppetizer, orderCount: 2)
    }
}
