//
//  NewViewController.swift
//  Taro
//
//  Created by Timur on 2/21/18.
//  Copyright © 2018 Timur Eskender. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.button1.layer.borderWidth = 2
        self.button1.layer.borderColor = UIColor.white.cgColor
        self.button2.layer.borderWidth = 2
        self.button2.layer.borderColor = UIColor.white.cgColor
        self.button3.layer.borderWidth = 2
        self.button3.layer.borderColor = UIColor.white.cgColor
        
        // Do any additional setup after loading the view.
    }
    @IBAction func onProfessionButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "SegueToResult", sender: nil)
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
