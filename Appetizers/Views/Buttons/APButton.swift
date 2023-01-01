//
//  APButton.swift
//  Appetizers
//
//  Created by Samed Dağlı on 1.01.2023.
//

import SwiftUI

struct APButton: View {
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.headline)
            .fontWeight(.semibold)
            .frame(width: 200, height: 50)
            .foregroundColor(.white)
            .background(Color(.systemPink))
            .cornerRadius(10)    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: "Test button")
    }
}
