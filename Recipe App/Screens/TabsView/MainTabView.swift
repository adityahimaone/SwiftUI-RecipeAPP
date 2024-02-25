//
//  MainTabView.swift
//  Recipe App
//
//  Created by Aditya Himawan on 25/02/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.yellow)
                Text("Search Functions")
            }
            .tabItem {
                Label("Discover", systemImage: "magnifyingglass")
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.indigo)
                Text("Settings Page")
            }
            .tabItem {
                Label("Profile", systemImage: "person")
            }
        }
        .tint(.orangePrimary)
    }
}

#Preview {
    MainTabView()
}
