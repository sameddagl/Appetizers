//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Samed Dağlı on 1.01.2023.
//

import Foundation

extension Date {
    var hundredYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -100, to: Date())!
    }
    
    var fifteenYearAgo: Date {
        Calendar.current.date(byAdding: .year, value: -15, to: Date())!
    }
}
