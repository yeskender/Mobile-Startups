//
//  ViewController.swift
//  QuizApp
//
//  Created by Timur on 2/19/18.
//  Copyright © 2018 Timur Eskender. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //BRONZE
    var questions = [["1", "Кто является создателем Facebook'a?", "mark", "bill", "ilon", "pavel"],
                     ["2", "Какой мессенджер является самым популярным?", "telegram", "facebook", "whatsapp", "talk"],
                     ["3", "Какой логотип принадлежит файлообменнику?", "apple", "dropbox", "huawei", "evernote"],
                     ["4", "Кто является создателем PayPal, SpaceX и Tesla?", "bill", "ilon", "mark", "pavel"],
                     ["5", "Какая компания занимает первое место в мире по рыночной капитализации?", "apple", "dropbox", "huawei", "evernote"]]
    
    var answers = ["mark", "whatsapp", "dropbox", "ilon", "apple"]
    
    var index = 0
    var total = 0
    var incorrect = 0
    var timer = Timer()
    var seconds: Int = 0
    

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionIndexLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.button1.layer.cornerRadius = 8
        self.button1.layer.masksToBounds = true
        self.button2.layer.cornerRadius = 8
        self.button2.layer.masksToBounds = true
        self.button3.layer.cornerRadius = 8
        self.button3.layer.masksToBounds = true
        self.button4.layer.cornerRadius = 8
        self.button4.layer.masksToBounds = true
        
        self.submitButton.isEnabled = false
        
        self.getQuestions()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.increaseSeconds), userInfo: nil, repeats: true)
        
    }
    
    @objc func increaseSeconds() {
        seconds += 1
    }
    
    func getQuestions() {
        self.questionIndexLabel.text = "Вопрос \(self.questions[index][0])"
        self.questionLabel.text = self.questions[index][1]
        self.button1.setBackgroundImage(UIImage(named: self.questions[index][2]), for: .normal)
        self.button2.setBackgroundImage(UIImage(named: self.questions[index][3]), for: .normal)
        self.button3.setBackgroundImage(UIImage(named: self.questions[index][4]), for: .normal)
        self.button4.setBackgroundImage(UIImage(named: self.questions[index][5]), for: .normal)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func clicked() {
        self.submitButton.isEnabled = true
        self.submitButton.setTitle("Продолжить", for: .normal)
        self.button1.isEnabled = false
        self.button2.isEnabled = false
        self.button3.isEnabled = false
        self.button4.isEnabled = false
    }
    
    func clear() {
        self.button1.layer.borderWidth = 0
        self.button1.layer.borderColor = UIColor.clear.cgColor
        self.button2.layer.borderWidth = 0
        self.button2.layer.borderColor = UIColor.clear.cgColor
        self.button3.layer.borderWidth = 0
        self.button3.layer.borderColor = UIColor.clear.cgColor
        self.button4.layer.borderWidth = 0
        self.button4.layer.borderColor = UIColor.clear.cgColor
        
        
        self.submitButton.isEnabled = false
        self.submitButton.setTitle("Выберите вариант", for: .normal)
        
        self.button1.isEnabled = true
        self.button2.isEnabled = true
        self.button3.isEnabled = true
        self.button4.isEnabled = true
        
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if self.questions[index][sender.tag] == self.answers[index] {
            sender.layer.borderWidth = 3
            sender.layer.borderColor = UIColor.green.cgColor
            self.total += 1
        } else {
            self.incorrect += 1
            sender.layer.borderWidth = 3
            sender.layer.borderColor = UIColor.red.cgColor
        }
        self.clicked()
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        self.clear()
        //SILVER
        if self.index < 4 {
            self.index += 1
            self.getQuestions()
        } else {
            //GOLD
            performSegue(withIdentifier: "SegueToResult", sender: nil)
            //SILVER
            /*let alert = UIAlertController(title: "Финиш", message: "Correct answers: \(self.total)\nIncorrect answers: \(self.incorrect)\nTime elapsed: \(self.seconds)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
                self.total = 0
                self.index = 0
                self.getQuestions()
            }))
            self.present(alert, animated: true, completion: nil)*/
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let vc = segue.destination as? NewViewController
        {
            vc.correct = self.total
            vc.seconds = self.seconds
        }
    }
}

