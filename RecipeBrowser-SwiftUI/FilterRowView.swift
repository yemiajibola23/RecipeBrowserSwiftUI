//
//  FilterRowView.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 6/30/23.
//

import SwiftUI

struct FilterRowView: View {
    @EnvironmentObject var mealService: MealService
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                ForEach(MealService.Category.allCases, id: \.self) { category in
                    Text(category.rawValue)
                        .fontWeight(.semibold)
                        .foregroundColor(mealService.categorySelected == category.rawValue ? .orange : .cyan)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .frame(maxWidth: .infinity)
                        .background {
                            if mealService.categorySelected == category.rawValue {
                                Capsule()
                                    .fill(.green.opacity(0.6))
                                    .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                            } // if statment
                        } //background
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                mealService.categorySelected = category.rawValue
                            }
                        } // on tap gesture
                } // ForEach
            } // HStack
            .padding(.horizontal, 12)
        }
    }
}

struct FilterRowView_Previews: PreviewProvider {
    static var previews: some View {
        FilterRowView()
            .environmentObject(MealService())
    }
}
