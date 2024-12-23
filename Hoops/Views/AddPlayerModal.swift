//
//  AddPlayerView.swift
//  Modal that pops up on TeamListComponent to add a new player to that team
//
//  Created by Fardin Haque on 5/31/24.
//

import Foundation
import SwiftData
import SwiftUI

struct AddPlayerModal: View {
    @Environment(\.modelContext) private var modelContext
    var team: Team
    
    @State var playerName: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Player Name", text: $playerName)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
                
                //TODO: add additional fields to create player
                
                Button(action: {
                    let player = Player(name: playerName, team: team)
                    modelContext.insert(player)
                    try? modelContext.save()
                }) {
                    Text("Add Player")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .navigationBarTitle("Add Player for Team \(team.name)", displayMode: .inline)
        }
        .navigationBarHidden(true)
    }
}
