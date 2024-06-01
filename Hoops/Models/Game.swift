//
//  Item.swift
//  Hoops
//
//  Created by Fardin Haque on 5/23/24.
//

import Foundation
import SwiftData

@Model
final class Game {
    var id: UUID = UUID() //auto generated id
    var createdTimestamp: Date //TODO: currently saves date and time game was created, data point not used anywhere. Look into removing potentially
    var ended: Bool
    var name: String
    
    var targetScore: Int
    var pointIncrement: Int
    var startDate: Int?
    var startTime: Int?
    var endDate: Int?
    var endTime: Int?
    var deuce: Bool
    
    @Relationship(deleteRule: .cascade) var teams: [Team] //relationship with teams, exactly 2 teams per game
    
    init(name: String, targetScore: Int, pointIncrement: Int, deuce: Bool, teams: [Team]) {
        self.name = name
        self.createdTimestamp = Date()
        self.ended = false
        
        self.targetScore = targetScore
        self.pointIncrement = pointIncrement
        self.deuce = deuce
        self.teams = teams
    }
}
