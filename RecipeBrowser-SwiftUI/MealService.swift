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
    
    @Published var categorySelected = "Beef"
    @Published var selectedMealCategories: [MealCategory] = []

}

