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
    @Environment(\.modelContext) private var modelContext
    @Query private var games: [Game]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if (games.isEmpty) {
                    Text("No games to show, click + to create one")
                        .padding()
                }
                
                List {
                    ForEach(games) { game in
                        NavigationLink {
                            Text(game.createdTimestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                        } label: {
                            Text("\(game.name)")
                                .bold()
                                .font(.title2)
                        }
                    }
                    .onDelete(perform: deleteGame)
                }
                
                Spacer()
            }
            .navigationTitle("Games")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CreateGameView()) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    private func deleteGame(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(games[index])
            }
        }
    }
}

#Preview {
    GamesView()
}
