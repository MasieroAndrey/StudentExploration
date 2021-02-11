//
//  ViewController.swift
//  memeMaker
//
//  Created by amasiero on 10/02/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed{
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed{
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
    
    var topChoice = [
        CaptionOpition(emoji: "🕶", caption: "Sabe o que eu acho legal"),
        CaptionOpition(emoji: "💥", caption: "Sabe o que me tira do serio?"),
        CaptionOpition(emoji: "💕", caption: "Sabe o qe eu adoro?"),
    ]
    var bottomChoice = [
        CaptionOpition(emoji: "🐱", caption: "Gatos de sapato"),
        CaptionOpition(emoji: "🐶", caption: "Cachorros de gorros"),
        CaptionOpition(emoji: "🐒", caption: "Macacos de burracos"),
    ]
    
    @IBAction func segmentedControlChange(_ sender: Any) {
        updateCaptions()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topSegmentedControl.removeAllSegments()
        bottomSegmentedControl.removeAllSegments()
        
        for index in topChoice {
            topSegmentedControl.insertSegment(withTitle: index.emoji, at: topChoice.count, animated: false)
        }
        topSegmentedControl.selectedSegmentIndex = 0
        for index in bottomChoice {
            bottomSegmentedControl.insertSegment(withTitle: index.emoji, at: bottomChoice.count, animated: false)
        }
        bottomSegmentedControl.selectedSegmentIndex = 0
        // Do any additional setup after loading the view.
        updateCaptions()
    }
    func updateCaptions() {
        let indexTop = topSegmentedControl.selectedSegmentIndex
        let indexBottom = bottomSegmentedControl.selectedSegmentIndex
        
        topCaptionLabel.text = topChoice[indexTop].caption
        bottomCaptionLabel.text = bottomChoice[indexBottom].caption
    }

}

