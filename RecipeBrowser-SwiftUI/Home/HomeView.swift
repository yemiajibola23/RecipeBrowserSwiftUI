//
//  ContentView.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 6/30/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var mealService: MealService
    
    var body: some View {
        NavigationStack {
                CategoryFilterView()
                CategoryContentView()
                Spacer()
                .navigationDestination(for: MealCategory.self) { meal in
                    MealDetailView(detailViewModel: MealDetailViewModel(category: meal))
                }
        }
        .padding(.top, 50)
        .onChange(of: mealService.categorySelected, perform: { newCategory in
            Task {
                await mealService.fetchMealCategory(newCategory)
            } // Task
        }) // on change
        .task {
            await mealService.fetchMealCategory(mealService.categorySelected)
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(MealService.test)
    }
}

