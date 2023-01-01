//
//  Order.swift
//  Appetizers
//
//  Created by Samed Dağlı on 1.01.2023.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        var sum: Double = 0
        items.forEach { sum += $0.price}
        return sum
    }
    
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func delete(at index: IndexSet) {
        items.remove(atOffsets: index)
    }
}
