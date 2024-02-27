//
//  CategoryListAllView.swift
//  Recipe App
//
//  Created by Aditya Himawan on 27/02/24.
//

import SwiftUI

struct CategoryListAllView: View {
    @StateObject private var categoriesVM = CategoriesVM()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(categoriesVM.categories, id: \.idCategory) { category in
                    NavigationLink(destination: MealCategoryListView(categoryTitle: category.strCategory, categoryFilter: category.strCategory)) {
                        HStack {
                            asyncImage(for: category)
                            Text(category.strCategory)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                        }
                    }
                }
                .listRowSeparator(.hidden)
                .navigationTitle("All Categories")
            }
            .task {
                await categoriesVM.fetchCategories()
            }
        }
    }
    
    // View for async image
    func asyncImage(for category: Category) -> some View {
        Group {
            if let url = URL(string: category.strCategoryThumb) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .scaledToFit()
                    case .failure(let error):
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 150, height: 150)
                                .foregroundStyle(.red)
                            Image(systemName: "xmark.octagon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .symbolRenderingMode(.hierarchical)
                                .foregroundStyle(.white)
                        }
                    @unknown default:
                        fatalError()
                    }
                }
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                Text("Invalid URL")
            }
        }
    }
}

#Preview {
    CategoryListAllView()
}
