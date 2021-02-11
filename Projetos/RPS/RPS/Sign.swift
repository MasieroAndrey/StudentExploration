//
//  Sign.swift
//  RPS
//
//  Created by amasiero on 09/02/21.
//

enum Sign {
    case paper, rock, scissors
    
    var sign: String{
        switch self {
        case .paper:
            return "✋"
        case .rock:
            return "👊"
        case .scissors:
            return "✌️"
            
        }
    }
    func gameState(opponentSign: Sign) -> GameState {
        if self == opponentSign {
            return .draw
        }
        switch self {
        case .rock:
            if opponentSign == .scissors {
                return .win
            }
        case .paper:
            if opponentSign == .rock {
                return .win
            }
        case .scissors:
            if opponentSign == .paper {
                return .win
            }
        }
        return .lose
    }
}

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    }else if sign == 1{
        return .paper
    } else {
        return .scissors
    }
}

