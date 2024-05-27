//
//  Team.swift
//  Hoops
//
//  Created by Fardin Haque on 5/27/24.
//

import Foundation
import SwiftData

@Model
final class Team {
    var id: UUID = UUID() //auto generated id
    var name: String
    
    
    init(name: String) {
        self.name = name
    }
}
