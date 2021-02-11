//
//  ViewController.swift
//  RPS
//
//  Created by amasiero on 09/02/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func rockChosen(_ sender: UIButton) {
        play(userSign: .rock)
    }
    @IBAction func paperChosen(_ sender: UIButton) {
        play(userSign: .paper)
    }
    @IBAction func scissorsChosen(_ sender: UIButton) {
        play(userSign: .scissors)
    }
    @IBAction func playAgain(_ sender: UIButton) {
        updateUI(state: .start)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(state: .start)
        // Do any additional setup after loading the view.
    }
    func updateUI(state: GameState) {
        statusLabel.text = state.status
        
        switch state {
        case .start:
            view.backgroundColor = .gray
            signLabel.text = "🤖"
            playAgainButton.isHidden = true
            rockButton.isHidden = false
            rockButton.isEnabled = true
            scissorsButton.isHidden = false
            scissorsButton.isEnabled = true
            paperButton.isHidden = false
            paperButton.isEnabled = true
        case .win:
            view.backgroundColor = .green
        case.lose:
            view.backgroundColor = .red
        case.draw:
            view.backgroundColor = .orange
        }
    }
    func play(userSign: Sign) {
        let computerSign = randomSign()
        let gameState = userSign.gameState(opponentSign: computerSign)
        updateUI(state: gameState)

        signLabel.text = computerSign.sign
        
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        switch userSign {
        case .paper:
            paperButton.isHidden = false
        case .rock:
            rockButton.isHidden = false
        case .scissors:
            scissorsButton.isHidden = false
        }
        playAgainButton.isHidden = false
    }
}

