//
//  CategoriesVM.swift
//  Recipe App
//
//  Created by Aditya Himawan on 25/02/24.
//

import Foundation

@MainActor
class CategoriesVM: ObservableObject {
    @Published var categories: [Category] = []
    
    // Fetch Categories
    func fetchCategories() async {
        do {
            let fetchedCategories = try await APIService.shared.fetchCategoriesServices()
            DispatchQueue.main.async {
                self.categories = fetchedCategories
            }
        } catch {
            print("Error: \(error)")
        }
    }
}
