//
//  NewViewController.swift
//  Lumosity Color Match
//
//  Created by Timur on 3/5/18.
//  Copyright © 2018 Timur Eskender. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    var right: Int = 0
    var wrong: Int = 0
    @IBOutlet weak var answersLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        answersLabel.text = "Correct answers: \(right)\nWrong answers: \(wrong)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onRestartButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "SegueToMain", sender: nil)
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
