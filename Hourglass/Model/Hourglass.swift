//
//  hourglass.swift
//  Hourglass
//
//  Created by Tao Ong and Caroline Zhou on 11/24/17.
//  Copyright © 2017 Tao Ong and Caroline Zhou. All rights reserved.
//

import Foundation

class Hourglass {
    
    var productive : Bool
    var productiveCounter : Double

    var unproductive : Bool
    var unproductiveCounter : Double
    
    var numTreesGrown = 0
    var activities = [String : Double]()
    
    init () {
        self.productive = false
        self.unproductive = false
        self.productiveCounter = 0.0
        self.unproductiveCounter = 0.0
        
        UserDefaults.standard.set(numTreesGrown, forKey: "numTreesGrown")
    }
    
}
