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
        }
        .onChange(of: mealService.categorySelected, perform: { newCategory in
            Task {
                await mealService.fetchMealCategory(newCategory)
            } // Task
        }) // on change
        .task {
            await mealService.fetchMealCategory(mealService.categorySelected)
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(MealService.test)
    }
}

