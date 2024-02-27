//
//  APIService.swift
//  Recipe App
//
//  Created by Aditya Himawan on 25/02/24.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    private init() {}
    
    func fetchCategoriesServices() async throws -> [Category]  {
        let urlString = URL(string: "\(Constants.baseURL)categories.php")
        
        guard let url = urlString else {
            print("😡 ERROR: Could not convert \(urlString?.absoluteString ?? "unknown") to a URL")
            throw URLError(.badURL)
        }
        
        print("🕸️ We are accessing the url \(url)")
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.init(rawValue: httpResponse.statusCode))
        }
        
        let decoder = JSONDecoder()
        let categories = try decoder.decode(CategoryResponse.self, from: data)
        
        return categories.categories
    }
    
    func fetchMealsByCategoryService(category: String) async throws -> [MealCategory] {
        let urlString = URL(string: "\(Constants.baseURL)filter.php?c=\(category)")
        
        guard let url = urlString else {
            print("😡 ERROR: Could not convert \(urlString?.absoluteString ?? "unknown") to a URL")
            throw URLError(.badURL)
        }
        
        print("🕸️ We are accessing the url \(url)")
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.init(rawValue: httpResponse.statusCode))
        }
        
        let decoder = JSONDecoder()
        let meals = try decoder.decode(MealCategoryResponse.self, from: data)
        
        return meals.meals
    }
    
    func fetchMealDetailByIdService(id: String) async throws -> [MealDetailResponse] {
        let urlString = URL(string: "\(Constants.baseURL)lookup.php?i=\(id)")
        
        guard let url = urlString else {
            print("😡 ERROR: Could not convert \(urlString?.absoluteString ?? "unknown") to a URL")
            throw URLError(.badURL)
        }
        
        print("🕸️ We are accessing the url \(url)")
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.init(rawValue: httpResponse.statusCode))
        }
        
        let decoder = JSONDecoder()
        let meals = try decoder.decode(MealResponse.self, from: data)
        print(meals, "meals")
        
        return meals.meals
    }
}
