//
//  Models.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 6/30/23.
//

import Foundation

struct Meal: Decodable {
    var id: String
    var name: String
    var thumbnail: String
    var category: String
    var origin: String
    var instructions: String
    var ingredients: [Ingredient]?
}

struct MealResponse: Decodable {
    var meals: [Meal]
}

struct Ingredient: Decodable {
    var name: String
    var measurement: String
}

struct MealCategory: Decodable, Hashable {
    var name: String
    var thumbnail: URL?
    var id: String
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case thumbnail = "strMealThumb"
        case id = "idMeal"
    }
}

struct MealCategoryResponse: Decodable {
    var categories: [MealCategory]
    
    enum CodingKeys: String, CodingKey {
        case categories = "meals"
    }
}


extension MealCategory {
    static let test = MealCategory(name: "Tunisian Orange Cake", thumbnail: URL(string: "https://www.themealdb.com/images/media/meals/y4jpgq1560459207.jpg")!, id: "52970")
}

extension Meal {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let dict = try container.decode([String: String?].self)
        
        var i = 1
        var ingredients: [Ingredient] = []
        
        while let ingredient = dict["strIngredient\(i)"] as? String,
              let measurement = dict["strMeasure\(i)"] as? String,
              !ingredient.isEmpty,
              !measurement.isEmpty {
            ingredients.append(Ingredient(name: ingredient, measurement: measurement))
            i += 1
        }
        self.ingredients = ingredients
        self.id = dict["idMeal"] as? String ?? ""
        self.name = dict["strMeal"] as? String ?? ""
        self.thumbnail = dict["strMealThumb"] as? String ?? ""
        self.origin = dict["strArea"] as? String ?? ""
        self.instructions = dict["strInstructions"] as? String ?? ""
        self.category = dict["strCategory"] as? String ?? ""
        
    }
    
    static let test = Meal(id: "53049", name: "Apam balik", thumbnail:  "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", category: "Dessert", origin: "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm.", instructions: "https://www.youtube.com/watch?v=6R8ffRRJcrg", ingredients: Meal.ingredientTest )
    
    static let ingredientTest: [Ingredient]?  = [
        Ingredient(name: "Milk", measurement: "200ml"),
        Ingredient(name: "Oil", measurement: "60ml"),
        Ingredient(name: "Eggs", measurement: "2"),
        Ingredient(name: "Flour", measurement: "1600g"),
        Ingredient(name: "Baking Powder", measurement: "3 tsp"),
        Ingredient(name: "Salt", measurement: "1/2 tsp"),
        Ingredient(name: "Unsalted Butter", measurement: "25g"),
        Ingredient(name: "Sugar", measurement: "45g"),
        Ingredient(name: "Peanut Butter", measurement: "3 tbs")
    ]
}

