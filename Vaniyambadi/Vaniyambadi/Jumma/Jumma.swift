//
//  Jumma.swift
//  Vaniyambadi
//
//  Created by Nouman Pervez on 04/03/20.
//  Copyright © 2020 Nouman Pervez. All rights reserved.
//

import Foundation

struct Jumma {
    
    var mosque: String
    var area: String
    var time: String
    
    init(mosque name: String, area location: String, time: String) {
        
        self.mosque = name
        self.area = location
        self.time = time
    }
}
