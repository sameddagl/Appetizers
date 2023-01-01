//
//  NetworkError.swift
//  Appetizers
//
//  Created by Samed Dağlı on 1.01.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
	case unableToComplete
	case invalidResponse
	case invalidData
}
