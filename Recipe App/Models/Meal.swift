//
//  Meal.swift
//  Recipe App
//
//  Created by Aditya Himawan on 26/02/24.
//

import Foundation

struct Meal: Codable {
    var idMeal: String
    var strMeal: String
    var strMealThumb: String
    var strArea: String
    var strCategory: String
    var strYoutube: String
    var strInstructions: String
    var strIngredients: [String]
    var strMeasures: [String]
}

struct MealDetailResponse: Codable {
    let idMeal: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let strTags: String?
    let strYoutube: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?
}


struct MealResponse: Decodable {
    var meals: [MealDetailResponse]
}

struct MealCategory: Codable {
    var idMeal: String
    var strMeal: String
    var strMealThumb: String
}

struct MealCategoryResponse: Decodable {
    var meals: [MealCategory]
}

extension Meal {
    static let data: [Meal] = [
        Meal(idMeal: "52874", strMeal: "Beef and Mustard Pie", strMealThumb: "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg", strArea: "Japanese",strCategory: "Chiken", strYoutube: "https://www.youtube.com/watch?v=4aZr5hZXP_s",  strInstructions: "Instructions", strIngredients: ["Beef", "Mustard"], strMeasures: ["1kg", "2tbsp"])
    ]
}

extension MealCategory {
    static let data: [MealCategory] = [
        MealCategory(idMeal: "52874", strMeal: "Beef and Mustard Pie", strMealThumb: "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg")
    ]
}
