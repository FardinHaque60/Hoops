//
//  AddPlayerView.swift
//  Hoops
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
        NavigationView {
            VStack {
                TextField("Player Name", text: $playerName)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
                    .padding()
                
                //TODO: add additional fields for player
                
                Button(action: {
                    /* TODO: Add player logic here
                     let player = Player(name: playerName)
                     
                     modelContext.add(player)
                     
                     try? modelContext.save()
                     */
                }) {
                    Text("Add Player")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
                
                Spacer()
            }
            .navigationBarTitle("Add Player for Team \(team.name)", displayMode: .inline)
        }
        .navigationBarHidden(true)
    }
}
