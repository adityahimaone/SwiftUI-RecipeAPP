//
//  CategoryListView.swift
//  Recipe App
//
//  Created by Aditya Himawan on 25/02/24.
//

import SwiftUI

struct CategoryListView: View {
    @StateObject private var categoriesVM = CategoriesVM()
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(categoriesVM.categories, id: \.idCategory) { category in
                    NavigationLink(destination: Text("OTW")) {
                        CategoryCardView(category: category)
                    }
                }
            }
            .overlay(
                VStack(alignment: .center) {
                    if categoriesVM.categories.isEmpty {
                        ProgressView()
                    }
                }
            )
            .task {
                await categoriesVM.fetchCategories()
            }
        }
    }
}

#Preview {
    CategoryListView()
}
