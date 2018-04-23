//
//  CarViewController.swift
//  Taro
//
//  Created by Timur on 2/21/18.
//  Copyright © 2018 Timur Eskender. All rights reserved.
//

import UIKit

class CarViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    var timer = Timer.init()
    var index = 0
    var index2 = 1
    var images = ["Audi", "BMW", "Mercedes", "Lada", "Lexus", "Toyota", "Volkswagen", "Peugeot", "Hyundai", "Bugatti", "Tesla", "KIA", "Lamborghini", "Aston Martin", "Alfa Romeo"]
    var images2 = ["audi", "bmw", "mercedes", "lada", "lexus", "toyota", "volkswagen", "peugeot", "hyundai", "bugatti", "tesla", "kia", "lamborghini", "astonmartin", "alfaromeo"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.button.layer.borderWidth = 2
        self.button.layer.borderColor = UIColor.white.cgColor
        self.button.setTitle("START", for: .normal)
        
        self.titleLabel.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        if self.button.titleLabel?.text == "START" {
            self.button.setTitle("STOP", for: .normal)
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(changePrediction), userInfo: nil, repeats: true)
        } else {
            self.timer.invalidate()
            self.button.setTitle("START", for: .normal)
        }
    }
    
    @objc func changePrediction() {
        //BRONZE
        //if self.index != self.predictions.count {
        if self.index2 != self.images.count {
            
            self.titleLabel.text = self.images[self.index2]
            self.imageView.image = UIImage(named: images2[index2])
            //self.index += 1
            self.index2 += 1
        } else {
            
            self.imageView.image = UIImage(named: images2[0])
            self.titleLabel.text = self.images[0]
            //self.index = 1
            self.index2 = 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
