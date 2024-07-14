//
//  TeamListComponent.swift
//  Hoops
//
//  Created by Fardin Haque on 5/31/24.
//

import Foundation
import SwiftUI
import SwiftData

struct TeamListComponent: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var expanded: Bool
    @Binding var team: Team
    @Query(filter: #Predicate<Player> { player in
        player.team.name == "Bob"
    }) var players: [Player]
    
    @Binding var playerModal: Bool
    @Binding var playerInfoModal: Player?
    
    var body: some View {
        VStack {
            HStack {
                Text("Players")
                Spacer()
                Button(action: {
                    playerModal = true
                }) {
                    Image(systemName: "plus.circle")
                        .foregroundColor(.blue)
                }
            }
            List { //TODO: reduce padding on top
                ForEach(players) { player in
                    NavigationLink {
                        GamesView()
                    } label: {
                        VStack(alignment: .leading) {
                            Text("\(player.name)")
                                .bold()
                                .font(.title2)
                        }
                    }
                }
            }
        }
        .onAppear { 
            print(players.count)
            print(players[0].team.name)
        }
        .padding(.vertical)
        .cornerRadius(10)
        /*
        Text("\(team.name)'s Team")
            .bold()
            .font(.headline)
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(Color(UIColor.systemGray6))
            .cornerRadius(10)
         */
    }
    
    private func deletePlayer(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                let player = players[index]
                modelContext.delete(player)
            }
            try? modelContext.save()
        }
    }
}
