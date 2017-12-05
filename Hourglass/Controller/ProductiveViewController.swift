//
//  ProductiveViewController.swift
//  Hourglass
//
//  Created by Caroline Zhou and Tao Ong on 11/28/17.
//  Copyright © 2017 Caroline Zhou and Tao Ong. All rights reserved.
//

import UIKit
import Lottie

class ProductiveViewController: UIViewController {
    
    var model : Hourglass!
    var currentTask = ""
    
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
            
            if var activities = UserDefaults.standard.value(forKey: "activities") as? Dictionary<String, Float> {
                activities.updateValue(self.model.productiveCounter, forKey: self.currentTask)
                print(activities)
            }
            
        } else if self.model.unproductive {
            self.model.unproductiveCounter += 0.1
            timerLabel.text = String(format: "%.1f", self.model.unproductiveCounter)
            
            if var activities = UserDefaults.standard.value(forKey: "activities") as? Dictionary<String, Float> {
                activities.updateValue(self.model.unproductiveCounter, forKey: self.currentTask)
                print(activities)
            }
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
        // Activity tracking logic. First presents an alert asking user to input task s/he is working on. Then stores mappings of task to time spent on task in a dictionary that is locally persistent.
        let alert = UIAlertController(title: "Alert", message: "Input Intended Task or Activity", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { [weak alert] (_) in
            self.currentTask = (alert?.textFields![0].text!)!      // alert.textFields![0].text! is the input text from the textfield in the alert
            if var activities = UserDefaults.standard.value(forKey: "activities") as? Dictionary<String, Double> {
                self.model.activities = activities
                self.model.activities.updateValue(0.0, forKey: self.currentTask)
                UserDefaults.standard.set(self.model.activities, forKey: "activities")
            }
            print(self.model.activities)
        }))
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "E.g. Studying for biology midterm"
            // textField.isSecureTextEntry = true     // for password input
        })
        self.present(alert, animated: true, completion: nil)
        
//        Use this for tracking number of times user began working on a task
//        if var result = UserDefaults.standard.value(forKey: "activities") as? Dictionary<String, Int> {
//            if let oldValue = result.updateValue(1, forKey: alert.textFields![0].text!) {
//                result.updateValue(oldValue + 1, forKey: alert.textFields![0].text!)
//            }
//        }
        
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
