//
//  Home.swift
//  Recipe App
//
//  Created by Aditya Himawan on 25/02/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            VStack {
                VStack {
                    HStack {
                        Text("Categories")
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
                    CategoryListView()
                    Spacer()
                }
                .padding()
            }
            .background(.orangeSecondary)
            .frame(width: .infinity, height: 300)
            Spacer()
        }
    }
}

#Preview {
    Home()
}
