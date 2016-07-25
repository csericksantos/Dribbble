//
//  Result.swift
//  Dribbble
//
//  Created by Erick Santos on 7/20/16.
//  Copyright © 2016 Erick Santos. All rights reserved.
//

enum Result<T, Errors> {
    case success(T)
    case failure(Errors)
}