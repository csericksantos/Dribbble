//
//  ShotService.swift
//  Dribbble
//
//  Created by Erick Santos on 7/21/16.
//  Copyright © 2016 Erick Santos. All rights reserved.
//

import Moya
import Moya_ModelMapper

struct ShotService: BaseService, Gettable {
    
    let provider = MoyaProvider<BaseAPI>()
    
    func get(completion: Result<[Shot], Errors> -> Void) {
        
        provider.request(.shots(id:nil)) { result in
            
            switch result {
            case .Success(let response):
                do {
                    
                    if response.statusCode == 200 {
                        let shots: [Shot] = try response.mapArray() as [Shot]
                        completion(Result.success(shots))
                    } else {
                        completion(self.handlerError(code: response.statusCode) as Result<[Shot], Errors>)
                    }
                    
                } catch Error.JSONMapping(response) {
                    completion(Result.failure(Errors.jsonMappingError))
                } catch {
                    completion(Result.failure(Errors.undefinedError(description: "Ops! Algo deu errado.")))
                }
            case .Failure(let error):
                var statusCode: Int = 0
                
                if let response = error.response {
                    statusCode = response.statusCode
                }
                
                completion(self.handlerError(code: statusCode) as Result<[Shot], Errors>)
                
            }
        }
    }
    
    func get(id: Int, completion: Result<Shot, Errors> -> Void) {
        
        provider.request(.shots(id: id)) { result in
            
            switch result {
            case .Success(let response):
                do {
                    
                    if response.statusCode == 200 {
                        let shot: Shot = try response.mapObject()
                        
                        completion(Result.success(shot))
                    } else {
                        completion(self.handlerError(code: response.statusCode) as Result<Shot, Errors>)
                    }
                    
                } catch Error.JSONMapping(response) {
                    completion(Result.failure(Errors.jsonMappingError))
                } catch {
                    completion(Result.failure(Errors.undefinedError(description: "Ops! Algo deu errado.")))
                }
            case .Failure(let error):
                var statusCode: Int = 0
                
                if let response = error.response {
                    statusCode = response.statusCode
                }
                
                completion(self.handlerError(code: statusCode) as Result<Shot, Errors>)
                
            }
        }
    }
}

