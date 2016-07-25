//
//  Gettable.swift
//  Dribbble
//
//  Created by Erick Santos on 7/20/16.
//  Copyright © 2016 Erick Santos. All rights reserved.
//

import Foundation

protocol Gettable {
    
    associatedtype DataArray
    associatedtype Data
    
    func get(completion: Result<DataArray, Errors> -> Void)
    func get(id: Int, completion: Result<Data, Errors> -> Void)
    
}
