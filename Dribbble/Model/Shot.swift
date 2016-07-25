//
//  Shot.swift
//  Dribbble
//
//  Created by Erick Santos on 7/21/16.
//  Copyright © 2016 Erick Santos. All rights reserved.
//

import Foundation
import Mapper

struct Shot: Mappable {
    
    let id: Int?
    let title: String?
    let description: String?
    let images: Images?
    let view: Int?
    let like: Int?
    let comment: Int?
    let user: User?
    
    init(map: Mapper) throws {
        id = map.optionalFrom("id")
        title = map.optionalFrom("title")
        description = map.optionalFrom("description")
        images = map.optionalFrom("images")
        view = map.optionalFrom("views_count")
        like = map.optionalFrom("likes_count")
        comment = map.optionalFrom("comments_count")
        user = map.optionalFrom("user")
    }
    
}
