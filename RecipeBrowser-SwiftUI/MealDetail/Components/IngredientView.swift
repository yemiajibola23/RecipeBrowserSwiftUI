//
//  IngredientView.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 7/1/23.
//

import SwiftUI

struct IngredientView: View {
    var ingredient: Ingredient
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .foregroundColor(.black)
                    .frame(height: 6)
                Text(ingredient.measurement)
                    .foregroundColor(.gray)
                    .font(.footnote)
                Text(ingredient.name)
                    .foregroundColor(.black)
                    .font(.caption)
                Spacer()
            } // HStack
            .font(.title3)
            .padding(.horizontal, 12)
        } // VStack
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView(ingredient: Meal.ingredientTest!.first!)
    }
}
