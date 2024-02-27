//
//  MealDetailView.swift
//  Recipe App
//
//  Created by Aditya Himawan on 26/02/24.
//

import SwiftUI

struct MealDetailView: View {
    @StateObject private var mealDetailVM = MealsVM()
    
    var body: some View {
        VStack {
            Text("Meal Detail View")
        }
        .task {
            await mealDetailVM.fetchMealDetail(id: "52772")
        }
    }
}

#Preview {
    MealDetailView()
}
