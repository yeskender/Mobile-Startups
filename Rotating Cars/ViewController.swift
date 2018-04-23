//
//  ViewController.swift
//  Rotating Cars
//
//  Created by Timur on 2/6/18.
//  Copyright © 2018 Timur Eskender. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var middleImageView: UIImageView!
    @IBOutlet weak var bottomImageView: UIImageView!
    @IBOutlet weak var centerImageView: UIImageView!
    @IBOutlet weak var rotateCarsButton: UIButton!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var lexusImageView: UIImageView!
    //BRONZE
    @IBAction func onRotateCarsButtonPressed(_ sender: UIButton) {
        let topImage = topImageView.image
        topImageView.image = middleImageView.image
        middleImageView.image = bottomImageView.image
        bottomImageView.image = lexusImageView.image
        lexusImageView.image = topImage
        
    }
    //SILVER
    @IBAction func onUpButtonPressed(_ sender: UIButton) {
        let topImage = topImageView.image
        topImageView.image = middleImageView.image
        middleImageView.image = bottomImageView.image
        bottomImageView.image = lexusImageView.image
        lexusImageView.image = topImage
    }
    @IBAction func onDownButtonPressed(_ sender: UIButton) {
        let lexusImage = lexusImageView.image
        lexusImageView.image = bottomImageView.image
        bottomImageView.image = middleImageView.image
        middleImageView.image = topImageView.image
        topImageView.image = lexusImage
        
        
        
    }
    //GOLD
    @objc func down(){
        let lexusImage = lexusImageView.image
        lexusImageView.image = bottomImageView.image
        bottomImageView.image = middleImageView.image
        middleImageView.image = topImageView.image
        topImageView.image = lexusImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        rotateCarsButton.layer.cornerRadius = 20
        upButton.layer.cornerRadius = 20
        downButton.layer.cornerRadius = 20
        var timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:  #selector(self.down), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

