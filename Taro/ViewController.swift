//
//  ViewController.swift
//  Taro
//
//  Created by Timur on 2/19/18.
//  Copyright © 2018 Timur Eskender. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var predictions = ["Архитектор", "Пилот", "Спасатель", "Кондитер", "Генетик", "Пожарный", "Космонавт", "Хирург", "Врач", "Следователь", "Астроном", "Художник", "Режиссер", "Исследователь", "Дизайнер", "Инженер", "Видеооператор", "Программист", "Повар", "Реаниматолог", "Эколог", "Каскадёр", "Актёр", "Прокурор", "Химик", "Кинолог", "Звукорежиссер", "Геофизик", "Эксперт", "Продюссер", "Композитор", "Руководитель", "Лаборант", "Певец", "Водолаз", "Бармен", "Географ", "Пекарь"]
    var timer = Timer.init()
    var index = 0
    var index2 = 1
    var images = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.button.layer.borderWidth = 2
        self.button.layer.borderColor = UIColor.white.cgColor
        self.button.setTitle("START", for: .normal)
        
        self.titleLabel.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        //SILVER
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
            //self.titleLabel.text = self.predictions[self.index]
            self.titleLabel.text = self.images[self.index2]
            self.imageView.image = UIImage(named: images[index2])
            //self.index += 1
            self.index2 += 1
        } else {
            
            self.imageView.image = UIImage(named: images[0])
            //self.titleLabel.text = self.predictions[0]
            self.titleLabel.text = self.images[0]
            //self.index = 1
            self.index2 = 1
        }
    }
}

