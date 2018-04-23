//
//  ViewController.swift
//  Color Switch
//
//  Created by Timur on 2/3/18.
//  Copyright © 2018 Timur Eskender. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func switchColorButtonPress(_ sender: UIButton) {
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        //let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        //let blue:CGFloat = CGFloat(drand48())
        //GOLD
        /*if button.backgroundColor == UIColor.blue && backgroundView.backgroundColor == UIColor.red  {
            button.backgroundColor = UIColor.red
            backgroundView.backgroundColor = UIColor.blue
        }
        else if button.backgroundColor == UIColor.red && backgroundView.backgroundColor == UIColor.blue {
            button.backgroundColor = UIColor.blue
            backgroundView.backgroundColor = UIColor.red
        }*/
        
        //SILVER
        backgroundView.backgroundColor = UIColor(hue: CGFloat(0.4), saturation: CGFloat(randomBlue), brightness: CGFloat(randomGreen), alpha: 1.0)
        button.backgroundColor = UIColor(hue: CGFloat(0.7), saturation: CGFloat(randomBlue), brightness: CGFloat(randomGreen), alpha: 1.0)
        
        //BRONZE
        /*backgroundView.backgroundColor = UIColor(displayP3Red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)*/
        /*button.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1.0)*/
    }
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet var backgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //GOLD
        button.backgroundColor = UIColor.red
        backgroundView.backgroundColor = UIColor.blue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

