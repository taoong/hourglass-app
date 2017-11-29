//
//  UnproductiveViewController.swift
//  Hourglass
//
//  Created by Caroline Zhou and Tao Ong on 11/28/17.
//  Copyright © 2017 Caroline Zhou and Tao Ong. All rights reserved.
//

import UIKit

class UnproductiveViewController: UIViewController {
    
    var model : Hourglass!
    
    var timer : Timer!
    var isPlaying = false

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var productiveButton: UIButton!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @objc func UpdateTimer() {
        self.model.unproductiveCounter += 0.1
        timeLabel.text = String(format: "%.1f", self.model.unproductiveCounter)
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
        self.model.unproductiveCounter = 0.0
        timeLabel.text = String(self.model.unproductiveCounter)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        timeLabel.text = String(self.model.unproductiveCounter)
        pauseButton.isEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if self.model.unproductiveCounter > 0.0 {
            if(isPlaying) {
                return
            }
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
