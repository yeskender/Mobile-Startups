//
//  ViewController.swift
//  SpyDetector
//
//  Created by Timur on 4/22/18.
//  Copyright © 2018 Timur Eskender. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var leftView: UIView!
    @IBAction func onYesButtonPressed(_ sender: UIButton) {
        if(leftTitleIndex == rightColorIndex) {
            statusImageView.isHidden = false
            statusImageView.image = UIImage(named: "success")
        } else {
            statusImageView.isHidden = false
            statusImageView.image = UIImage(named: "fail")
        }
        setupViews()
    }
    @IBAction func onNoButtonPressed(_ sender: UIButton) {
        if(leftTitleIndex != rightColorIndex) {
            statusImageView.isHidden = false
            statusImageView.image = UIImage(named: "success")
        } else {
            statusImageView.isHidden = false
            statusImageView.image = UIImage(named: "fail")
        }
        setupViews()
    }
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var rightColorLabel: UILabel!
    @IBOutlet weak var leftColorLabel: UILabel!
    
    
    var leftColorIndex = 0
    var leftTitleIndex = 0
    var rightColorIndex = 0
    var rightTitleIndex = 0
    
    var colors = [UIColor.black, UIColor.green, UIColor.purple, UIColor.orange, UIColor.red, UIColor.yellow, UIColor.cyan, UIColor.brown]
    var titles = ["Black", "Green", "Purple", "Orange", "Red", "Yellow", "Cyan", "Brown"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftView.layer.cornerRadius = 8
        rightView.layer.cornerRadius = 8
        
        leftView.layer.shadowOpacity = 0.5
        leftView.layer.shadowOffset = CGSize(width: 0, height: 2)
        leftView.layer.shadowRadius = 10
        leftView.layer.shadowColor = UIColor.black.cgColor
        
        rightView.layer.shadowOpacity = 0.5
        rightView.layer.shadowOffset = CGSize(width: 0, height: 2)
        rightView.layer.shadowRadius = 10
        rightView.layer.shadowColor = UIColor.black.cgColor
        
        setupViews()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupViews() {
        leftColorIndex = Int(arc4random_uniform(UInt32(colors.count)))
        leftTitleIndex = Int(arc4random_uniform(UInt32(titles.count)))
        
        rightColorIndex = Int(arc4random_uniform(UInt32(colors.count)))
        rightTitleIndex = Int(arc4random_uniform(UInt32(titles.count)))
        
        leftColorLabel.textColor = colors[leftColorIndex]
        leftColorLabel.text = titles[leftTitleIndex]

        rightColorLabel.textColor = colors[rightColorIndex]
        rightColorLabel.text = titles[rightTitleIndex]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

