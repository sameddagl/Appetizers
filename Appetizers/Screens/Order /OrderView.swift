//
//  OrderView.swift
//  Appetizers
//
//  Created by Samed Dağlı on 1.01.2023.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            OrderListCell(appetizer: appetizer, orderCount: order.orderCount(of: appetizer))
                        }
                        .onDelete { index in
                            order.delete(at: index)
                        }
                    }
                    .listStyle(.plain)
                    
                    Button {
                        
                    } label: {
                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Add to order")
                            .background(Color(.secondarySystemFill))
                    }
                    .padding(.bottom, 30)
                }
                
                if order.isEmpty {
                    EmptyStateView(imageName: "food-placeholder", message: "No orders yet")
                }
            }
            .navigationTitle("Orders")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
