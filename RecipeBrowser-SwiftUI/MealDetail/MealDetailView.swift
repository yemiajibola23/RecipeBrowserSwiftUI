//
//  MealDetailView.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 7/1/23.
//

import SwiftUI

struct MealDetailView: View {
    @EnvironmentObject var mealService: MealService
    @StateObject var detailViewModel: MealDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(detailViewModel.mealDetails) { meal in
                    VStack {
                        DetailImageView(meal: meal)
                        DetailNameLabel(meal: meal)
                        InstructionsView(isInstructionsTapped: $detailViewModel.isInstructionsTapped, instructions: meal.instructions)
                    } // VStack
                    .padding(.bottom, 30)
                    ForEach(meal.ingredients ?? [], id: \.self) { ingredient in
                        IngredientView(ingredient: ingredient)
                    }// ForEach-ingredients
                } //ForEach-mealDetails
            } // VStack
        }// ScrollView
        .frame(width: .infinity)
        .background {
            Color(.yellow)
                .ignoresSafeArea()
        } // background
        .task {
            await detailViewModel.getMealDetails()
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(detailViewModel: MealDetailViewModel(category: .test))
            .environmentObject(MealService())
    }
}
