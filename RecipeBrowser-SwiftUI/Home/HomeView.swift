//
//  ContentView.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 6/30/23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationStack {
            CategoryFilterView()
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
