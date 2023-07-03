//
//  MealService.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 6/30/23.
//

import Foundation

class MealService: ObservableObject {
    enum Category: String, CaseIterable {
        case Beef = "Beef"
        case Breakfast = "Breakfast"
        case Chicken = "Chicken"
        case Dessert = "Dessert"
        case Goat = "Goat"
        case Lamb = "Lamb"
        case Miscellaneous = "Miscellaneous"
        case Pasta = "Pasta"
        case Pork = "Pork"
        case Seafood = "Seafood"
        case Side = "Side"
        case Starter = "Starter"
        case Vegan = "Vegan"
        case Vegetarian = "Vegetarian"
    }
    
    @Published var categorySelected = "Dessert"
    @Published var selectedMealCategories: [MealCategory] = []
    @Published var networkLayerError: NetworkLayerError?
    @Published var mealDetails: [MealDetails] = []
    
    private let mealRepos = MealRepos()
    
    // runs on main thread
    @MainActor func fetchMealCategory(_ category: String) async {
        do {
            selectedMealCategories = try await mealRepos.getCategoryList(category: category).categories.sorted(by: { $0.name < $1.name })
        } catch {
            networkLayerError = error as? NetworkLayerError ?? .general(error)
            
        }
    }
    
    @MainActor func fetchMealDetails(_ category: MealCategory) async {
        do {
            mealDetails = try await mealRepos.getMealDetails(id: category.id).mealDetails
        } catch {
            networkLayerError = error as? NetworkLayerError ?? .general(error)
        }
    }
}

extension MealService {
    static var test: MealService {
        let service = MealService()
        service.selectedMealCategories = [.test]
        return service
    }
}

