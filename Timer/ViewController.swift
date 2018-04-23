//
//  ViewController.swift
//  Timer
//
//  Created by Timur on 2/6/18.
//  Copyright © 2018 Timur Eskender. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startPauseButton: UIButton!
    var timer = Timer()
    var seconds: Int = 0
    //var seconds: Int = 60
    
    @IBAction func onStartPauseButtonPressed(_ sender: UIButton) {
        if(startPauseButton.currentTitle! == "Start"){
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.increaseSeconds), userInfo: nil, repeats: true)
            startPauseButton.setTitle("Pause", for: .normal)
        } else {
            timer.invalidate()
            startPauseButton.setTitle("Start", for: .normal)
        }
    }
    //BRONZE
    @objc func increaseSeconds() {
        seconds += 1
        //seconds += 5
        timerLabel.text = String(format: "%02d", seconds / 60) + ":" + String(format: "%02d", seconds % 60)
    }
    //SILVER
    //GOLD
    @objc func decreaseSeconds() {
        //seconds += 1
        seconds -= 1
        timerLabel.text = String(format: "%02d", seconds / 60) + ":" + String(format: "%02d", seconds % 60)
        if(seconds == 0){
            timer.invalidate()
            startPauseButton.isHidden = true
        }
    }
    
    @IBAction func onRestartButtonPressed(_ sender: UIButton) {
        seconds = 0
        //seconds = 60
        timerLabel.text = "00:00"
        startPauseButton.isHidden = false
    }
    @IBOutlet weak var restartButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
