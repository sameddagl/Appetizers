//
//  Appetizer.swift
//  Appetizers
//
//  Created by Samed Dağlı on 1.01.2023.
//

import Foundation

// MARK: - Appetizer
struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

// MARK: - Request
struct Appetizer: Decodable, Identifiable, Equatable {
    let id: Int
    let price: Double
    let protein, calories: Int
    let requestDescription: String
    let carbs: Int
    let name: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case price, protein, calories
        case requestDescription = "description"
        case id, carbs, name, imageURL
    }
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 001, price: 10.999, protein: 120, calories: 400, requestDescription: "This is a mock description.", carbs: 200, name: "Apple", imageURL: "")
    static let sampleAppetizer1 = Appetizer(id: 002, price: 10.999, protein: 120, calories: 400, requestDescription: "This is a mock description.", carbs: 200, name: "Carrot", imageURL: "")
    static let sampleAppetizer2 = Appetizer(id: 003, price: 10.999, protein: 120, calories: 400, requestDescription: "This is a mock description.", carbs: 200, name: "Tomato", imageURL: "")

    
    static let appetizers = [sampleAppetizer, sampleAppetizer1, sampleAppetizer2]
}
