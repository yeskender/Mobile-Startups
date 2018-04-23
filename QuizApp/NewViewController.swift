//
//  NewViewController.swift
//  QuizApp
//
//  Created by Timur on 2/19/18.
//  Copyright © 2018 Timur Eskender. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var timeElapsedLabel: UILabel!
    //GOLD
    var correct: Int = 0
    var seconds: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "Correct answers: \(correct)\nTime Elapsed: \(seconds)"
        // Do any additional setup after loading the view.
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
