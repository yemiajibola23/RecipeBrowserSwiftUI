//
//  MealCategoryView.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 6/30/23.
//

import SwiftUI

struct MealCategoryView: View {
    var meal: MealCategory
    var body: some View {
        VStack {
            AsyncImage(url: meal.thumbnail) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(color: .black.opacity(0.4), radius: 2, x: -8, y: 5)
                    .overlay {
                        LinearGradient(colors: [.clear, .black.opacity(0.6)], startPoint: .top, endPoint: .bottom)
                            .cornerRadius(12)
                    } // overlay
                    .overlay(alignment: .bottomLeading) {
                        Text(meal.name)
                            .multilineTextAlignment(.leading)
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 120)
                            .padding(.leading, 8)
                            .padding(.bottom, 20)
                        
                    } // overlay
                
            } placeholder: {
                ProgressView()
                    .frame(width: 200, height:  300)
            } // placeholder
        } // VStack
        .padding()
    }
}

struct MealCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        MealCategoryView(meal: MealCategory.test)
    }
}

