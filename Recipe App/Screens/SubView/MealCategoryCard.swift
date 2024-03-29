//
//  MealCategoryCard.swift
//  Recipe App
//
//  Created by Aditya Himawan on 26/02/24.
//

import SwiftUI

struct MealCategoryCard: View {
    var mealCategory: MealCategory
    
    init(mealCategory: MealCategory) {
        self.mealCategory = mealCategory
    }
    
    var body: some View {
      VStack {
        HStack {
            VStack(alignment: .leading) {
            asyncImage(for: mealCategory)
          }
//          .frame(maxWidth: .infinity)

          VStack {
            Text(mealCategory.strMeal)
          }
//          .frame(maxWidth: .infinity)
        }
      }
    }
    
    func asyncImage(for mealCategory: MealCategory) -> some View {
        Group {
            if let url = URL(string: mealCategory.strMealThumb) {
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
    MealCategoryCard(mealCategory: MealCategory.data[0])
}
