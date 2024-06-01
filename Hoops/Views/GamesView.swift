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
            VStack() {
                if (games.isEmpty) {
                    Text("No games to show, click + to create one")
                        .padding()
                }
                
                List { //TODO: reduce padding on top
                    ForEach(games) { game in
                        NavigationLink {
                            GameInfoView(game: game)
                        } label: {
                            VStack(alignment: .leading) {
                                Text("\(game.name)")
                                    .bold()
                                    .font(.title2)
                                Text("\(game.teams[0].name) vs. \(game.teams[1].name)")
                                    .font(.subheadline)
                            }
                        }
                    }
                    .onDelete(perform: deleteGame)
                }
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
                
                Spacer()
            }
            .navigationBarTitle("Games", displayMode: .inline)
        }
    }
    
    private func deleteGame(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                let game = games[index]
                modelContext.delete(game.teams[0]) //TODO: manually deleting children teams due to bug with cascading delete, this is the workaround
                modelContext.delete(game.teams[1])
                modelContext.delete(game)
            }
            try? modelContext.save()
        }
    }
}

#Preview {
    GamesView()
        .modelContainer(for: Game.self, inMemory: true)
}
