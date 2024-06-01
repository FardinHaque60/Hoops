//
//  TeamListComponent.swift
//  Hoops
//
//  Created by Fardin Haque on 5/31/24.
//

import Foundation
import SwiftUI

struct TeamListComponent: View {
    @Binding var expanded: Bool
    var team: Team
    
    @Binding var playerModal: Bool
    
    var body: some View {
        DisclosureGroup(isExpanded: $expanded) {
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
                List {
                    
                }
            }
            .padding(.vertical)
            .cornerRadius(10)
        } label: {
            Text("\(team.name)'s Team")
                .bold()
                .font(.headline)
                .padding(10)
                .frame(maxWidth: .infinity)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
        }
    }
}
