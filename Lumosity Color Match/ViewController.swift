//
//  ViewController.swift
//  Lumosity Color Match
//
//  Created by Timur on 3/5/18.
//  Copyright © 2018 Timur Eskender. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var wrongAnswersLabel: UILabel!
    @IBOutlet weak var rightAnswersLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var leftLabel: UILabel!
    let colors = [UIColor.red, UIColor.black, UIColor.brown, UIColor.green, UIColor.orange, UIColor.yellow, UIColor.blue, UIColor.purple]
    
    let colorsTitle = ["RED", "BLACK", "BROWN", "GREEN", "ORANGE", "YELLOW", "BLUE", "PURPLE"]
    
    var leftColorIndex = 0
    var leftTitleIndex = 0
    var rightColorIndex = 0
    var rightTitleIndex = 0
    var right = 0
    var wrong = 0
    var timer = Timer()
    var seconds: Int = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupViews()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseSeconds), userInfo: nil, repeats: true)
        
    }
    
    @objc func decreaseSeconds() {
        seconds -= 1
        timerLabel.text = String(format: "%02d", seconds / 60) + ":" + String(format: "%02d", seconds % 60)
        if(seconds == 0){
            performSegue(withIdentifier: "SegueToResult", sender: nil)
        }
    }
    
    @IBAction func yesButtonPressed(_ sender: UIButton) {
        if(leftTitleIndex == rightColorIndex){
            self.statusLabel.text = "Right!"
            self.statusLabel.backgroundColor = UIColor.green
            right+=1
        } else {
            self.statusLabel.text = "Wrong!"
            self.statusLabel.backgroundColor = UIColor.red
            wrong+=1
        }
        setupViews()
    }
    
    @IBAction func noButtonPressed(_ sender: UIButton) {
        if(leftTitleIndex != rightColorIndex){
            self.statusLabel.text = "Right!"
            self.statusLabel.backgroundColor = UIColor.green
            right+=1
        } else {
            self.statusLabel.text = "Wrong!"
            self.statusLabel.backgroundColor = UIColor.red
            wrong+=1
        }
        setupViews()
    }
    
    func setupViews() {
        leftColorIndex = Int(arc4random_uniform(UInt32(colors.count)))
        rightColorIndex = Int(arc4random_uniform(UInt32(colors.count)))
        leftTitleIndex = Int(arc4random_uniform(UInt32(colors.count)))
        rightTitleIndex = Int(arc4random_uniform(UInt32(colors.count)))
        
        leftLabel.text = colorsTitle[leftTitleIndex]
        leftLabel.backgroundColor = colors[leftColorIndex]
        rightLabel.text = colorsTitle[rightTitleIndex]
        rightLabel.backgroundColor = colors[rightColorIndex]
        
        rightAnswersLabel.text = String(right)
        wrongAnswersLabel.text = String(wrong)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let vc = segue.destination as? NewViewController
        {
            vc.right = self.right
            vc.wrong = self.wrong
        }
    }

}

