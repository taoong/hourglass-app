//
//  ProductiveViewController.swift
//  Hourglass
//
//  Created by Caroline Zhou and Tao Ong on 11/28/17.
//  Copyright © 2017 Caroline Zhou and Tao Ong. All rights reserved.
//

import UIKit

class ProductiveViewController: UIViewController {
    
    var model : Hourglass!
    
    var timer = Timer()
    var isPlaying = false

    @IBOutlet weak var productiveOrNot: UILabel!
    var productiveOrNotText = "Productive"
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    @objc func UpdateTimer() {
        if self.model.productive {
            self.model.productiveCounter += 0.1
            timerLabel.text = String(format: "%.1f", self.model.productiveCounter)
            if self.model.productiveCounter.truncatingRemainder(dividingBy: 3600) == 0 {
                self.model.numTreesGrown += 1
            }
        } else if self.model.unproductive {
            self.model.unproductiveCounter += 0.1
            timerLabel.text = String(format: "%.1f", self.model.unproductiveCounter)
        }
    }
    
    @IBAction func startTimer(_ sender: AnyObject) {
        if(isPlaying) {
            return
        }
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func pauseTimer(_ sender: AnyObject) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
    }
    
    @IBAction func resetTimer(_ sender: AnyObject) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
        if self.model.productive {
            self.model.productiveCounter = 0.0
            timerLabel.text = String(self.model.productiveCounter)
        } else if self.model.unproductive {
            self.model.unproductiveCounter = 0.0
            timerLabel.text = String(self.model.unproductiveCounter)
        }
    }
    
    @IBAction func switchTimer(_ sender: AnyObject) {
        if (self.model.productive) {
            resetTimer(sender)
            self.model.unproductive = true
            self.model.productive = false
            self.model.productiveCounter = 0.0
            productiveOrNot.text = "Unproductive"
        }
        else if (self.model.unproductive) {
            resetTimer(sender)
            self.model.unproductive = false
            self.model.productive = true
            self.model.unproductiveCounter = 0.0
            productiveOrNot.text = "Productive"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.text = String(self.model.productiveCounter)
        pauseButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.productiveOrNot.text = self.productiveOrNotText
        self.timer.invalidate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if self.model.productiveCounter > 0.0 || self.model.unproductiveCounter > 0.0 {
            startButton.isEnabled = false
            pauseButton.isEnabled = true
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
            isPlaying = true
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
