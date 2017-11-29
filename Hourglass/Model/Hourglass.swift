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
    var productiveVC : ProductiveViewController?
    var productiveCounter : Float

    var unproductive : Bool
    var unproductiveVC : UnproductiveViewController?
    var unproductiveCounter : Float
    
    var numTreesGrown : Int
    
    init () {
        self.numTreesGrown = 0
        self.productive = false
        self.unproductive = false
        productiveCounter = 0.0
        unproductiveCounter = 0.0
    }
    
}
