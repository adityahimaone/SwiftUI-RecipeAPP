//
//  MealCategoryListView.swift
//  Recipe App
//
//  Created by Aditya Himawan on 26/02/24.
//

import SwiftUI

struct MealCategoryListView: View {
    let categoryTitle: String
    let categoryFilter: String
    @StateObject private var mealCategoriesVM = MealsVM()

    var body: some View {
        NavigationStack {
            List {
                ForEach(mealCategoriesVM.mealsCategory, id: \.idMeal) { meal in
                    NavigationLink(destination: Text("OTW")) {
                        MealCategoryCard(mealCategory: meal)
                    }
                }
                .listRowSeparator(.hidden)
            }
            .task {
                await mealCategoriesVM.fetchMealsCategory(category: categoryFilter)
            }
            .navigationTitle(categoryTitle)
        }
    }
}

#Preview {
    MealCategoryListView(categoryTitle: "Beef", categoryFilter: "Beef")
}
