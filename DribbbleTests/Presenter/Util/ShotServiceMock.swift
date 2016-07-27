//
//  ShotServiceMock.swift
//  Dribbble
//
//  Created by Erick Santos on 7/27/16.
//  Copyright © 2016 Erick Santos. All rights reserved.
//

import Foundation
@testable import Dribbble

class ShotServiceMock: Gettable {
    
    var callError = false
    var callEmpty = false
    var wasCalled = false
    
    func get (completion: Result<[Shot], Errors> -> Void) {
        
        wasCalled = true
        
        let firstShot = Shot(id: 1, title: "Title 1", description: "Description 1", images: Images(high: NSURL(), normal: NSURL(), teaser: NSURL()), view: 10, like: 100, comment: 1000, user: User(id: 1, name: "User 1", avatar: NSURL(), location: "Location 1"))
        
        let secondShot = Shot(id: 2, title: "Title 2", description: "Description 2", images: Images(high: NSURL(), normal: NSURL(), teaser: NSURL()), view: 20, like: 200, comment: 2000, user: User(id: 2, name: "User 2", avatar: NSURL(), location: "Location 2"))
        
        if callError {
            completion(Result.failure(Errors.undefinedError(description: "Testando falha")))
        } else {
            if callEmpty {
                completion(Result.success(Array<Shot>()))
            } else {
                completion(Result.success([firstShot, secondShot]))
            }
        }
        
    }
    
    func get (id: Int, completion: Result<Shot, Errors> -> Void) {
        
        wasCalled = true
        
        switch id {
        case 1:
            let firstShot = Shot(id: 1, title: "Title 1", description: "Description 1", images: Images(high: NSURL(), normal: NSURL(), teaser: NSURL()), view: 10, like: 100, comment: 1000, user: User(id: 1, name: "User 1", avatar: NSURL(), location: "Location 1"))
            completion(Result.success(firstShot))
        case 2:
            let secondShot = Shot(id: 2, title: "Title 2", description: "Description 2", images: Images(high: NSURL(), normal: NSURL(), teaser: NSURL()), view: 20, like: 200, comment: 2000, user: User(id: 2, name: "User 2", avatar: NSURL(), location: "Location 2"))
            completion(Result.success(secondShot))
        default:
            completion(Result.failure(Errors.undefinedError(description: "Não encontrado")))
        }
        
        
    }
    
}
