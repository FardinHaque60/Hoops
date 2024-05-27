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
    var createdTimestamp: Date
    var ended: Bool
    var name: String
    
    var targetScore: Int
    var pointIncrement: Int
    var startDate: Int?
    var startTime: Int?
    var endDate: Int?
    var endTime: Int?
    var deuce: Bool
    
    
    init(name: String, targetScore: Int, pointIncrement: Int, deuce: Bool) {
        self.name = name
        self.createdTimestamp = Date()
        self.ended = false
        
        self.targetScore = targetScore
        self.pointIncrement = pointIncrement
        self.deuce = deuce
    }
}
