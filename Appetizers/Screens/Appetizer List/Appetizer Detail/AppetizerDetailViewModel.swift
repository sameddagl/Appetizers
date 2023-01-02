//
//  AppetizerDetailViewModel.swift
//  Appetizers
//
//  Created by Samed Dağlı on 1.01.2023.
//

import SwiftUI

final class AppetizerDetailViewModel: ObservableObject {
    let appetizer: Appetizer
    var isShowingDetail: Binding<Bool>
        
    init(appetizer: Appetizer, isShowingDetail: Binding<Bool>) {
        self.appetizer = appetizer
        self.isShowingDetail = isShowingDetail
    }
    
}
