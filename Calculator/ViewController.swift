//
//  ViewController.swift
//  Calculator
//
//  Created by Timur on 2/21/18.
//  Copyright © 2018 Timur Eskender. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var firstNumber: String = ""
    var secondNumber: String = ""
    var operation: String = ""
    var fullNum = ""
    var curNum = ""
    
    @IBOutlet weak var calculationLabel: UILabel!
    //BRONZE
    func splitString(str: String) -> String {
        var cnt = 0
        var num = ""
        for ch in str {
            if (cnt == 3) {
                num += " "
                cnt = 0
            }
            num += String(ch)
            cnt += 1
        }
        
        return String(num.reversed())
    }
    
    func setLabel(num: String) {
        print(num)
        let res = num.components(separatedBy: ".")
        if (res.count == 2) {
            
            curNum = splitString(str: String(res[0].reversed()))
            curNum += "." + splitString(str: res[1])
        } else {
            curNum = splitString(str: String(res[0].reversed()))
        }
        
        secondNumber = num
        calculationLabel.text = curNum
    }
    
    @IBAction func onDigitButtonPressed(_ sender: UIButton) {
        if ((calculationLabel.text?.count)! < 16) {
            if (sender.currentTitle == "0") {
                if (calculationLabel.text != "0"){
                    fullNum += sender.currentTitle!
                    setLabel(num: fullNum)
                }
            } else {
                fullNum += sender.currentTitle!
                setLabel(num: fullNum)
            }
        }
    }
    @IBAction func onClearButtonPressed(_ sender: UIButton) {
        firstNumber = ""
        secondNumber = ""
        operation = ""
        fullNum = ""
        curNum = ""
        calculationLabel.text = ""
    }
    //GOLD
    @IBAction func onDeleteButtonPressed(_ sender: UIButton) {
        if(fullNum != "") {
            fullNum.remove(at: fullNum.index(before: fullNum.endIndex))
        }
        setLabel(num: fullNum)
    }
    
    @IBAction func onResultButtonPressed(_ sender: UIButton) {
        var result: Double?
        switch operation {
        case "/":
            if(Int(secondNumber) == 0) {
                calculationLabel.text = "Error"
            } else {
                result = Double(firstNumber)! / Double(secondNumber)!
            }
        case "x":
            result = Double(firstNumber)! * Double(secondNumber)!
        case "+":
            result = Double(firstNumber)! + Double(secondNumber)!
        case "-":
            result = Double(firstNumber)! - Double(secondNumber)!
        //SILVER
        case "%":
            result = (Double(firstNumber)! * Double(secondNumber)!) / 100
        default:
            result = 0
        }
        
        if let result = result {
            setLabel(num: String(result))
            secondNumber = String(result)
        }
        
        fullNum = ""
        curNum = ""
        firstNumber = ""
    }
    
    
    @IBAction func onOperationButtonPressed(_ sender: UIButton) {
        if (calculationLabel.text != ""){
            firstNumber = calculationLabel.text!
        }
        calculationLabel.text = ""
        fullNum = ""
        curNum = ""
        firstNumber = secondNumber
        secondNumber = ""
        operation = sender.currentTitle!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

