//
//  Player.swift
//  Hoops
//
//  Created by Fardin Haque on 6/1/24.
//

import Foundation
import SwiftData

@Model
final class Player {
    var id: UUID = UUID()
    var name: String
    var team: Team
    
    init(name: String, team: Team) {
        self.name = name
        self.team = team
    }
    
}
