//
//  GameState.swift
//  RPS
//
//  Created by amasiero on 09/02/21.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    var status: String{
        switch self {
        case .start:
            return "Rock, Paper or scissors"
        case .win:
            return "You Won!!"
        case .lose:
            return "You Lost!!"
        case .draw:
            return "It's a Draw"
            
        }
    }
    
    
    
}


