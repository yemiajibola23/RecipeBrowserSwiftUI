//
//  MealRequest.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 7/1/23.
//

import Foundation

enum MealRequest {
    case mealDetailsById(String)
    case allCategories
    case filterByCategory(String)
}

extension MealRequest: APIRequest {
    var path: String {
        switch self {
        case .allCategories:
            return "list.php"
        case .mealDetailsById:
            return "lookup.php"
        case .filterByCategory:
            return "filter.php"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .mealDetailsById:
            return .get
        case .allCategories:
            return .get
        case .filterByCategory:
            return .get
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .mealDetailsById(let id):
            return [URLQueryItem(name: "i", value: id)]
        case .allCategories:
            return [URLQueryItem(name: "c", value: "list")]
        case .filterByCategory(let category):
            return [URLQueryItem(name: "c", value: category)]
        }
    }
}
