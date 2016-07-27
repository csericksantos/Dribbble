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
    
    init(id: Int?, title: String?, description: String?, images:Images?, view: Int?, like: Int?, comment: Int?, user: User?) {
        
        self.id = id
        self.title = title
        self.description = description
        self.images = images
        self.view = view
        self.like = like
        self.comment = comment
        self.user = user
        
    }
    
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
