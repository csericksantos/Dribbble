//
//  BaseService.swift
//  Dribbble
//
//  Created by Erick Santos on 7/21/16.
//  Copyright © 2016 Erick Santos. All rights reserved.
//

protocol BaseService {
    func handlerError<T>(code code: Int) -> Result<T, Errors>
}

extension BaseService {
    
    func handlerError<T>(code code: Int) -> Result<T, Errors> {
        
        switch (code) {
        case 401:
            return Result.failure(Errors.unauthorizedError)
        default:
            return Result.failure(Errors.undefinedError(description: "Ops! Algo deu errado."))
        }
        
    }
    
}