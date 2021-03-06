//
//  Images.swift
//  Dribbble
//
//  Created by Erick Santos on 7/21/16.
//  Copyright © 2016 Erick Santos. All rights reserved.
//

import Foundation
import Mapper

struct Images: Mappable {
    
    let high: NSURL?
    let normal: NSURL?
    let teaser: NSURL?
    
    
    init(high: NSURL?, normal: NSURL?, teaser: NSURL?) {
        
        self.high = high
        self.normal = normal
        self.teaser = teaser
        
    }
    
    init(map: Mapper) throws {
        high = map.optionalFrom("hidpi")
        normal = map.optionalFrom("normal")
        teaser = map.optionalFrom("teaser")
    }
    
}