//
//  NamazTimings.swift
//  Vaniyambadi
//
//  Created by Nouman Pervez on 05/03/20.
//  Copyright © 2020 Nouman Pervez. All rights reserved.
//

import Foundation

struct NamazTimings {
    
    var time: String
    var namaz: String
    
    init(_ namaz: String, _ time: String) {
        
        self.namaz = namaz
        self.time = time
    }
}
