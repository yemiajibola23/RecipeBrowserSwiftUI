//
//  RecipeBrowser_SwiftUIApp.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 6/30/23.
//

import SwiftUI

@main
struct RecipeBrowser_SwiftUIApp: App {
    @StateObject var mealService = MealService()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(mealService)
        }
    }
}
