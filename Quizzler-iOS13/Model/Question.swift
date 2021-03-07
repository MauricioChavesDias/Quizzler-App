//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Mauricio Dias on 2/3/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text : String
    let answer  : [String]
    let correctAnswer : String

    init(q: String, a : [String], correctAnswer: String) {
        self.text =  q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}
