//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Mauricio Dias on 2/3/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
// 

import Foundation


struct QuizBrain {
    var questionNumber = 0
    var gameIsOver = false
    var score = 0
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]
    
    
    mutating func checkAnswer(answer userAnswer: Int) -> Bool {
        if getUserAnswer(answer: userAnswer) == getCorrectAnswer() {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func nextQuestion() {
        if isThereMoreQuestions() {
            questionNumber += 1
            gameIsOver = false
        } else {
            gameIsOver = true
        }
    }
    
    mutating func isGameOver() -> Bool {
      return gameIsOver
    }
    
    mutating func restartGame() {
        questionNumber = 0
        score = 0
        gameIsOver = false
    }
    
    func isThereMoreQuestions() -> Bool {
      return (questionNumber + 1 < quiz.count)
    }
    
    func getUserAnswer(answer userAnswer: Int) -> String {
        return quiz[questionNumber].answer[userAnswer]
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getAnswer1Text() -> String {
        return quiz[questionNumber].answer[0]
    }
    
    func getAnswer2Text() -> String {
        return quiz[questionNumber].answer[1]
    }
    
    func getAnswer3Text() -> String {
        return quiz[questionNumber].answer[2]
    }
    
    func getCorrectAnswer() -> String {
        return quiz[questionNumber].correctAnswer
    }
    
    func getProgress() -> Float {
        return Float(questionNumber+1) / Float(quiz.count)
    }
    
    func getScore() -> Int {
        return score
    }

}
