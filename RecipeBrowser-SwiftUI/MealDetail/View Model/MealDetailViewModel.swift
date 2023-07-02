//
//  DetailViewModel.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 7/1/23.
//

import Foundation

class MealDetailViewModel: ObservableObject {
    var category: MealCategory
    
    @Published var isInstructionsTapped = false
    
    init(category: MealCategory) {
        self.category = category
    }
}
