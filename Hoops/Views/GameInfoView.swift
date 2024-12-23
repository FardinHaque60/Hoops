//
//  GameInfoView.swift
//  Info of any clicked game
//
//  Created by Fardin Haque on 5/29/24.
//

import Foundation
import SwiftUI
import SwiftData

struct GameInfoView: View {
    @Environment(\.modelContext) private var modelContext
    var game: Game
    @State private var team1Expanded = false
    @State private var team2Expanded = false
    
    @State private var addPlayerTeam1: Bool = false
    @State private var addPlayerTeam2: Bool = false
    @State private var selectedPlayer: Player? = nil

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                /*
                TeamListComponent(
                    expanded: $team1Expanded,
                    team: game.teams[0],
                    playerModal: $addPlayerTeam1,
                    playerInfoModal: $selectedPlayer
                )
                TeamListComponent(
                    expanded: $team2Expanded,
                    team: game.teams[1],
                    playerModal: $addPlayerTeam2,
                    playerInfoModal: $selectedPlayer
                ) 
                 */

                Spacer()
            }
            .padding(.horizontal)
            .navigationBarTitle("\(game.name) Details", displayMode: .inline)
            .sheet(isPresented: $addPlayerTeam1) {
                AddPlayerModal(team: game.teams[0])
            }
            .sheet(isPresented: $addPlayerTeam2) {
                AddPlayerModal(team: game.teams[1])
            }
            .sheet(isPresented: .constant(selectedPlayer != nil)) {
                //TODO: add modal view for player information
            }
        }
    }
}
