//
//  CategoryContentview.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 6/30/23.
//

import SwiftUI

struct CategoryContentView: View {
    @EnvironmentObject var mealService: MealService
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(mealService.selectedMealCategories, id: \.self) { meal in
                    NavigationLink(value: meal) {
                        MealCategoryView(meal: meal)
                    } // Navigation Link
                    
                } // ForEach
            } // Lazy HStack
        }
    }
}


struct CategoryContentView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        CategoryContentView()
            .environmentObject(MealService.test)
    }
    
}
