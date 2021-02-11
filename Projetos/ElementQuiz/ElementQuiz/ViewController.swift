//
//  ViewController.swift
//  ElementQuiz
//
//  Created by amasiero on 10/02/21.
//

import UIKit
enum Mode{
    case flashCard, quiz
    
}


enum State {
    case question, answer, score
}



class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var modeSelector: UISegmentedControl!
    @IBOutlet weak var showAnswerButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var mode: Mode = .flashCard {
        didSet{
            switch mode {
            case .flashCard:
                setupFlashCards()
            case .quiz:
                setupQuiz()
            }
            updateUI()
        }
    }
    var state: State = .question
    var answerIsCorrect = false
    var correctAnswerCount = 0
    
    @IBAction func switchModes(_ sender: Any) {
        if modeSelector.selectedSegmentIndex == 0 {
            mode = .flashCard
        }else{
            mode = .quiz
        }
    }
    
    
    @IBAction func showAnswer(_ sender: Any) {
        state = .answer
        updateUI()
    }
    
    @IBAction func next(_ sender: Any) {
        currentElementIndex += 1
        if currentElementIndex >= elementList.count{
            currentElementIndex = 0
            if mode == .quiz {
                state = .score
                updateUI()
                return
            }
        }
        state = .question
        updateUI()
    }
    let fixedElementList  = ["Carbon","Gold","Chlorine","Sodium"]
    var elementList: [String] = []
    var currentElementIndex = 0
    
    
    func updateFlashCardUI(elementName: String) {
        showAnswerButton.isHidden = false
        nextButton.isEnabled = true
        nextButton.setTitle("Next Element", for: .normal)
        modeSelector.selectedSegmentIndex = 0
        textField.isHidden = true
        textField.resignFirstResponder()
        state == .answer ? (answerLabel.text = elementName): (answerLabel.text = "?")
    }
    
    func updateQuizUI(elementName: String) {
        showAnswerButton.isHidden = true
        modeSelector.selectedSegmentIndex = 1
        textField.isHidden = false
        
        currentElementIndex == elementList.count-1 ? (nextButton.setTitle("Show Score", for: .normal)) : (nextButton.setTitle("Next Question", for: .normal))
        
        switch state {
        case .question:
            nextButton.isEnabled = false
        case .answer:
            nextButton.isEnabled = true
        case .score:
            nextButton.isEnabled = false
        }
        
        switch state {
        case .question:
            textField.isEnabled = true
            textField.text = ""
            textField.becomeFirstResponder()
        case .answer:
            textField.isEnabled = false
            textField.resignFirstResponder()
        case .score:
            textField.isHidden = true
            textField.resignFirstResponder()
        }
        
        switch state{
        case .question:
            answerLabel.text = ""
        case .answer:
            answerIsCorrect ? (answerLabel.text = "Correct Answer!!"):(answerLabel.text = "❌\nWrong Answer")
        case .score:
            answerLabel.text = ""
            displayScoreAlert()
        }
    }
    
    func updateUI() {
        let elementName = elementList[currentElementIndex]
        let image = UIImage(named: elementName)
        imageView.image = image
        switch mode{
        case .flashCard:
            updateFlashCardUI(elementName: elementName)
        case .quiz:
            updateQuizUI(elementName: elementName)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textFieldComponents = textField.text!
        
        if textFieldComponents.lowercased() == elementList[currentElementIndex].lowercased(){
            answerIsCorrect = true
            correctAnswerCount += 1
        }else{
            answerIsCorrect = false
        }
        
        state = .answer
        updateUI()
        return true
        
    }
    
    
    func displayScoreAlert() {
        let alert = UIAlertController(title: "Quiz Score", message: "Your score is \(correctAnswerCount) out of \(elementList.count)", preferredStyle: .alert)
        
        let dismissAction = UIAlertAction(title: "OK", style: .default, handler: scoreAlertDismissed(_:))
        alert.addAction(dismissAction)
        present(alert, animated: true, completion: nil)
        
        
    }
    func scoreAlertDismissed(_ action: UIAlertAction) {
        state =  .question
        mode = .flashCard
    }
    
    func setupFlashCards() {
        
        state = .question
        currentElementIndex = 0
        elementList = fixedElementList
    }
    func setupQuiz() {
        
        state = .question
        currentElementIndex = 0
        answerIsCorrect = false
        correctAnswerCount = 0
        elementList = fixedElementList.shuffled()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mode = .flashCard
        // Do any additional setup after loading the view.
    }
    
    
}

