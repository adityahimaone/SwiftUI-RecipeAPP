//
//  CategoryListView.swift
//  Recipe App
//
//  Created by Aditya Himawan on 25/02/24.
//

import SwiftUI

struct CategoryListView: View {
    let backgroundColor: Color
    
    @StateObject private var categoriesVM = CategoriesVM()
    
    let gridItems = [GridItem(.fixed(150), spacing: 8)]
    
    var body: some View {
        NavigationStack {
            List {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: gridItems, spacing: 12) {
                        ForEach(categoriesVM.categories.prefix(8), id: \.idCategory) { category in
                            NavigationLink(destination: MealCategoryListView(categoryTitle: category.strCategory, categoryFilter: category.strCategory)) {
                                CategoryCardView(category: category)
                            }
                        }
                    }
                    .padding()
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .contentMargins(4, for: .scrollContent)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                .background(backgroundColor)
            }
            .listStyle(.plain)
        }
        .task {
            await categoriesVM.fetchCategories()
        }
    }
}

#Preview {
    CategoryListView(backgroundColor: .orangeSecondary)
}
