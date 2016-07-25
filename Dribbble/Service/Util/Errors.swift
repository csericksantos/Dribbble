//
//  Errors.swift
//  Dribbble
//
//  Created by Erick Santos on 7/20/16.
//  Copyright © 2016 Erick Santos. All rights reserved.
//

import Foundation

enum Errors: ErrorType {
    case jsonMappingError
    case unauthorizedError
    case undefinedError(description: String)
    
    func message() -> String {
        switch self {
        case .jsonMappingError:
            return "Não foi possível Mapear o JSON"
        case .unauthorizedError:
            return "Não autorizado"
        case .undefinedError(let description):
            return description
        }
    }
    
    static let allErrors = [jsonMappingError, unauthorizedError, undefinedError(description: "")]
}
