//
//  MealsVM.swift
//  Recipe App
//
//  Created by Aditya Himawan on 26/02/24.
//

import Foundation

@MainActor
class MealsVM: ObservableObject {
    @Published var mealsCategory: [MealCategory] = []
    @Published var meal: [MealDetailResponse] = []
    
    func fetchMealsCategory(category: String) async {
        do {
            let fetchedMealsCategory = try await APIService.shared.fetchMealsByCategoryService(category: category)
            DispatchQueue.main.async {
                self.mealsCategory = fetchedMealsCategory
            }
        } catch {
            print("Error: \(error)")
        }
    }
    
    func fetchMealDetail(id: String) async {
        do {
            let fetchedMeal = try await APIService.shared.fetchMealDetailByIdService(id: id)
            DispatchQueue.main.async {
                self.meal = fetchedMeal
            }
        } catch {
            print("Error: \(error)")
        }
    }
}
