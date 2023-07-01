//
//  DetailViewModel.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 7/1/23.
//

import Foundation

class MealDetailViewModel: ObservableObject {
    var mealRepos = MealRepos()
    var category: MealCategory
    
    @Published var mealDetails: [Meal] = []
    @Published var isInstructionsTapped = false
    
    init(category: MealCategory) {
        self.category = category
    }
    
    @MainActor func getMealDetails() async {
        do {
            mealDetails = try await mealRepos.getMealDetails(id: category.id).meals
        } catch {
            print(error.localizedDescription)
        }
    }
}
