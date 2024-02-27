//
//  Home.swift
//  Recipe App
//
//  Created by Aditya Himawan on 25/02/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Categories")
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                    NavigationLink {
                        CategoryListAllView()
                    } label: {
                        Text("See All")
                            .font(.headline)
                            .foregroundStyle(.orangePrimary)
                    }
                }
                .padding(.horizontal)
                CategoryListView(backgroundColor: .orangeSecondary)
            }
            .background(.orangeSecondary)
            .frame(width: .infinity, height: 250)
            VStack {
                HStack {
                    Text("Sweets")
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        print("See All")
                    } label: {
                        Text("See All")
                            .font(.headline)
                            .foregroundStyle(.orangePrimary)
                    }
                }
                .padding(.horizontal)
                CategoryListView(backgroundColor: .clear)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    Home()
}
