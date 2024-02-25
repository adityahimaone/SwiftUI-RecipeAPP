//
//  Categories.swift
//  Recipe App
//
//  Created by Aditya Himawan on 25/02/24.
//

import Foundation

struct Category: Codable {
    let idCategory: String // Identifiable property must be a constant
    var strCategory: String
    var strCategoryThumb: String
    var strCategoryDescription: String
}

struct CategoryResponse: Decodable {
    var categories: [Category]
}

extension Category {
    static let data: [Category] = [
        Category(idCategory: "1", strCategory: "Beef", strCategoryThumb: "https://www.themealdb.com/images/category/beef.png", strCategoryDescription: "Beef description")
    ]
}
