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
            ScrollView {
                HStack {
                    ForEach(MealService.Category.allCases, id: \.self) { category in
                        Text(category.rawValue)
                            .fontWeight(.semibold)
                            .foregroundColor(mealService.categorySelected == category.rawValue ? .orange : .cyan)
                    }
                }
            }
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(MealService())
    }
}
