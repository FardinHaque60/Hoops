//
//  CreateGameView.swift
//  Hoops
//
//  Created by Fardin Haque on 5/24/24.
//

import Foundation
import SwiftUI
import SwiftData

struct CreateGameView: View {
    @State private var gameName = ""
    @State private var team1 = ""
    @State private var team2 = ""
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            TextField("Game Name", text: $gameName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.top, 20)
            
            TextField("Team 1 Name", text: $team1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            TextField("Team 2 Name", text: $team2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Text("Pick a start date: ")
                .padding(.horizontal)
            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
                .padding(.horizontal, 30)
            
            HStack {
                Text("Select a start time: ")
                    .padding(.horizontal, 20)
                DatePicker(
                    "",
                    selection: $selectedTime,
                    displayedComponents: .hourAndMinute
                )
                .datePickerStyle(GraphicalDatePickerStyle())
                .labelsHidden()
                .padding(.horizontal, 20)
            }
            Spacer()
            
            Button(action: {
                print("Submit button tapped")
            }) {
                Text("Submit")
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .navigationBarTitle("Create Game")
    }
}

#Preview {
    CreateGameView()
}
