//
//  MealDetailView.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 7/1/23.
//

import SwiftUI

struct MealDetailView: View {
    @StateObject var detailViewModel: MealDetailViewModel
    @EnvironmentObject var mealService: MealService
    @State var isShowingAlert = false
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(mealService.mealDetails) { meal in
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
        .frame(maxWidth: .infinity)
        .background {
            Color(.systemMint)
                .ignoresSafeArea()
        } // background
        .onChange(of: mealService.networkLayerError, perform: { newValue in
            isShowingAlert = newValue != nil
        })
        .task {
            await mealService.fetchMealDetails(detailViewModel.category)
        }
        .alert(isPresented: $isShowingAlert) {
            Alert(title: Text(mealService.networkLayerError?.title ?? ""), message: Text(mealService.networkLayerError?.message ?? ""))
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(detailViewModel: MealDetailViewModel(category: .test))
            .environmentObject(MealService())
    }
}
