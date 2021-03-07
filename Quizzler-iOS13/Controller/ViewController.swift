//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//  edited by: Mauricio Dias on 02/03/2021.


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var question1Button: UIButton!
    @IBOutlet weak var question2Button: UIButton!
    @IBOutlet weak var question3Button: UIButton!
 
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetProgressBar()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
         
        let userAnswer = sender.tag
        let userGotItRight = quizBrain.checkAnswer(answer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        updateUI()
    }
   
    func resetProgressBar(){
        progressBar.progress = 0.0
    }
    
    func dialogToAlertTheGameIsOver(){
        // create the alert
        let alert = UIAlertController(title: "Congratulations!", message: "You've had \(quizBrain.getScore()) question(s) correct!", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        quizBrain.restartGame()
    }
    
    func updateUI() {
        if quizBrain.isGameOver() {
            dialogToAlertTheGameIsOver()
        }
        
        clearBackgroundColourButtons()
        scoreLabel.text = "Score : \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
        questionLabel.text = quizBrain.getQuestionText()

        question1Button.setTitle(quizBrain.getAnswer1Text(), for: .normal)
        question2Button.setTitle(quizBrain.getAnswer2Text(), for: .normal)
        question3Button.setTitle(quizBrain.getAnswer3Text(), for: .normal)
    }
    
    //Timer to clean the background colour of the buttons true and false after pressed.
    func clearBackgroundColourButtons() {
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (Timer) in
            //clean the background color
            self.question1Button.backgroundColor = UIColor.clear
            self.question2Button.backgroundColor = UIColor.clear
            self.question3Button.backgroundColor = UIColor.clear
            
        }
        
    }
}

