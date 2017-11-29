//
//  ViewController.swift
//  Hourglass
//
//  Created by Tao Ong and Caroline Zhou on 11/23/17.
//  Copyright © 2017 Tao Ong and Caroline Zhou. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var model : Hourglass!
    
    @IBOutlet weak var numTrees: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.model = Hourglass()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.numTrees.text = String(model.numTreesGrown)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toProductive(sender: UIButton) {
        performSegue(withIdentifier: "segueToProductive", sender: sender)
    }
    
    @IBAction func toUnproductive(sender: UIButton) {
        performSegue(withIdentifier: "segueToUnproductive", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "segueToProductive" {
                if let dest = segue.destination as? ProductiveViewController {
                    self.model.productive = true
                    self.model.unproductive = false
                    self.model.unproductiveCounter = 0.0
                    self.model.productiveVC = dest
                    if self.model.productive == false && self.model.unproductive == false {
                        dest.timer = Timer()
                        self.model.productiveCounter = 0.0
                        
                    } else {
                        self.model.unproductiveVC?.model = self.model
                    }
                    dest.model = self.model
                }
            } else if identifier == "segueToUnproductive" {
                if let dest = segue.destination as? UnproductiveViewController {
                    self.model.unproductive = true
                    self.model.productive = false
                    self.model.productiveCounter = 0.0
                    self.model.unproductiveVC = dest
                    if self.model.unproductive == false && self.model.productive == false {
                        dest.timer = Timer()
                        self.model.productiveCounter = 0.0
                        
                    } else {
                        self.model.productiveVC?.model = self.model
                    }
                    dest.model = self.model
                }
            }
        }
    }

}

