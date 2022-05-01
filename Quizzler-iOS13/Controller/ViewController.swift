//
//  ViewController.swift
//  Quizzler-iOS13
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var ProgressBar: UIProgressView!
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        quizBrain.nextQuestion()
        quizBrain.getScore(userGotItRight)
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        firstAnswerButton.backgroundColor = UIColor.clear
        secondAnswerButton.backgroundColor = UIColor.clear
        thirdAnswerButton.backgroundColor = UIColor.clear
        firstAnswerButton.setTitle(quizBrain.getAnswerText(number: 0), for: .normal)
        secondAnswerButton.setTitle(quizBrain.getAnswerText(number: 1), for: .normal)
        thirdAnswerButton.setTitle(quizBrain.getAnswerText(number: 2), for: .normal)

        ProgressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.score)"
    }
}

