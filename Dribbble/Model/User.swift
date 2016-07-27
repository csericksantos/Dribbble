//
//  User.swift
//  Dribbble
//
//  Created by Erick Santos on 7/21/16.
//  Copyright © 2016 Erick Santos. All rights reserved.
//

import Foundation
import Mapper

struct User: Mappable {
    
    let id: Int?
    let name: String?
    let avatar: NSURL?
    let location: String?
    
    init (id: Int?, name: String?, avatar: NSURL?, location: String?) {
        
        self.id = id
        self.name = name
        self.avatar = avatar
        self.location = location
        
    }
    
    init(map: Mapper) throws {
        id = map.optionalFrom("id")
        name = map.optionalFrom("name")
        avatar = map.optionalFrom("avatar_url")
        location = map.optionalFrom("location")
    }
    
}