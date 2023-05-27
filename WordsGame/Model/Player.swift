//
//  Player.swift
//  WordsGame
//
//  Created by Arina on 20.05.2023.
//

import Foundation

class Player {
    var name: String
    private (set) var score: Int = 0
    
    init(name: String) {
        self.name = name
    }
    
    func addScore(count: Int) {
        guard count > 0 else { return }
        self.score += count
    }
    
    
}


