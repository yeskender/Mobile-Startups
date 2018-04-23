//
//  GuessNumberViewController.swift
//  Akinator
//
//  Created by Timur on 2/12/18.
//  Copyright © 2018 Timur Eskender. All rights reserved.
//

import UIKit

class GuessNumberViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var biggerButton: UIButton!
    @IBOutlet weak var lessButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func onLessButtonPressed(_ sender: UIButton) {
        binarySearchStep(isRight: false)
        print("Hey")
    
    }
    @IBOutlet weak var yes2Button: UIButton!
    
    @IBAction func onBiggerButtonPressed(_ sender: UIButton) {
        binarySearchStep(isRight: true)
        
    }
    @IBAction func onYesButtonPressed(_ sender: UIButton) {
        
    }
    @IBAction func onRestartButtonPressed(_ sender: UIButton) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = main.instantiateViewController(withIdentifier: "mainVC")
        self.present(mainVC, animated: true, completion: nil)
    
    }
    
    @IBAction func onYes2ButtonPressed(_ sender: UIButton) {
        imageView.image = UIImage(named: "Illustration:Happy")
        lessButton.isHidden = true
        biggerButton.isHidden = true
        yes2Button.isHidden = true
        backgroundView.isHidden = true
        print("Yes")
    }
    var left = 0
    var right = 100
    var middle = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        makeGuess()

        // Do any additional setup after loading the view.
    }
    func makeGuess(){
        middle = (left + right)/2
        numberLabel.text = "\(middle)"
    }
    func binarySearchStep(isRight:Bool){
        if(isRight){
            left = middle + 1
        } else{
            right = middle - 1
        }
        makeGuess()
    }
}
