//
//  Recipe.swift
//  Recipe App
//
//  Created by Aditya Himawan on 25/02/24.
//

import Foundation

struct Recipe: Codable, Hashable {
    let id: String
        let name: String
        let category: String
        let area: String
        let instructions: String
        let imageURL: URL?
        let tags: [String]
        let youtubeURL: URL?
        let ingredients: [String]
        let measures: [String]
}
