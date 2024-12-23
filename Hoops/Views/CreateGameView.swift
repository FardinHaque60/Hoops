//
//  CreateGameView.swift
//  Button rendered when "+" clicked on GamesView page
//
//  Created by Fardin Haque on 5/24/24.
//

import Foundation
import SwiftUI
import SwiftData

struct CreateGameView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var gameName = ""
    @State private var targetScore = ""
    @State private var pointIncrement = ""
    @State private var team1 = ""
    @State private var team2 = ""
    @State private var isYesSelected: Bool = false
    
    @State private var gameSaved: Bool = false
    @State private var goHome: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                TextField("Game Name", text: $gameName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.top, 20)
                
                HStack {
                    TextField("Points to win", text: $targetScore) //TODO: add handling for numeric only check see line 69 for potential impl location
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Point Units", text: $pointIncrement)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                DeuceButtons(isYesSelected: $isYesSelected)
                
                Text("Team Information")
                    .bold()
                    .font(.title)
                TextField("Team 1 Name", text: $team1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Team 2 Name", text: $team2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Spacer()
                
                Button(action: addGame) { //TODO: redirect to games page and have notification for successful game creation
                    Text("Submit")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .alert(isPresented: $gameSaved) {
                    Alert(title: Text("Success"), message: Text("Game created successfully"), dismissButton: .default(Text("OK")) {
                        goHome = true
                    })
                }
            }
            .padding(.horizontal)
            .navigationBarTitle("Create Game", displayMode: .inline)
            .navigationDestination(isPresented: $goHome) {
                GamesView()
            }
        }
    }
    
    private func addGame() { //TODO: handle numeric only inputs for targetScore, pointInc, etc. in this method and alert user of invalid inp
        let game = Game(name: gameName, targetScore: Int(targetScore)!, pointIncrement: Int(pointIncrement)!, deuce: isYesSelected, teams: [])
        modelContext.insert(game)
        
        let team1 = Team(name: team1, game: game)
        modelContext.insert(team1)
        
        let team2 = Team(name: team2, game: game)
        modelContext.insert(team2)
        
        do {
            try modelContext.save()
            gameSaved = true
        }
        catch {
            print("game failed to save")
        }
    }
}

#Preview {
    CreateGameView()
}
