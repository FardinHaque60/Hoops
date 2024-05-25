//
//  GamesView.swift
//  Home/Initial page that shows list of games
//
//  Created by Fardin Haque on 5/24/24.
//

import Foundation
import SwiftUI
import SwiftData

struct GamesView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("No games to show, click + to create one")
                    .padding()
                
                Spacer()
            }
            .navigationTitle("Games")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CreateGameView()) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    GamesView()
}
