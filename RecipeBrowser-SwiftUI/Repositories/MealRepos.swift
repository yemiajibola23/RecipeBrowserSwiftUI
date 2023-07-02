//
//  MealRepos.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 7/1/23.
//

import Foundation

protocol MealReposProtocol {
    func getCategoryList(category: String) async throws -> MealCategoryResponse
    func getMealDetails(id: String) async throws -> MealDetailsResponse
}


final class MealRepos: MealReposProtocol {
    let handler = NetworkHandler()
    
    func getCategoryList(category: String) async throws -> MealCategoryResponse {
        let request = MealRequest.filterByCategory(category)
        return try await handler.handle(request: request)
    }
    
    func getMealDetails(id: String) async throws -> MealDetailsResponse {
        let request = MealRequest.mealDetailsById(id)
        return try await handler.handle(request: request)
    }
    
    
}
