//
//  Player.swift
//  lifecounter
//
//  Created by Henry Bao on 4/26/22.
//

import Foundation

class Player {
    var health: Int
    var name: String
    
    init(name: String, health: Int) {
        self.health = health
        self.name = name
    }
    func add(healthToAdd: Int) {
        self.health += healthToAdd
    }
    func subtract(healthToSubtract: Int) {
        self.health -= healthToSubtract
    }
    func changeName(newName: String) {
        self.name = newName
    }
}
