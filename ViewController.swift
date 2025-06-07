//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questions: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!

    let declarations=QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButton(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let correctAnswer = questionData.answer[qNo]

        if userAnswer == correctAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.qNo = (self.qNo + 1) % self.questionData.questions.count
            self.updateUI()
        }
    }

    func updateUI() {
        questions.text = questionData.questions[qNo]
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = Float(qNo + 1) / Float(questionData.questions.count)
    }
}
