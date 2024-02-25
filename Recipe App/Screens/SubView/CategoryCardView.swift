//
//  CategoryCardView.swift
//  Recipe App
//
//  Created by Aditya Himawan on 25/02/24.
//

import SwiftUI

struct CategoryCardView: View {
    var category: Category
    
    init(category: Category) {
        self.category = category
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            asyncImage(for: category)
            Text(category.strCategory)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
        }
        .frame(width: 100, height: 150)
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5)
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
    CategoryCardView(category: Category.data[0])
}
