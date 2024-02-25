//
//  ContentView.swift
//  Recipe App
//
//  Created by Aditya Himawan on 25/02/24.
//

import SwiftUI

struct ContentView: View {
    let imgUrl = URL(string: "https://www.seriouseats.com/thmb/2t-o0351k2g66Q1m8hB9y8f7t734v8000x0000/1200x800/gado-gado-recipe-indonesia-food.jpg")
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            AsyncImage(url: imgUrl) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .scaledToFill()
                case .failure(let error):
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
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
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
