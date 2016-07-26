//
//  BaseAPI.swift
//  Dribbble
//
//  Created by Erick Santos on 7/20/16.
//  Copyright © 2016 Erick Santos. All rights reserved.
//

import Foundation
import Moya

public enum BaseAPI {
    case shots(id: Int?)
}

extension BaseAPI: TargetType {
    public var baseURL: NSURL {
        return NSURL(string: EnvironmentUtil.baseURL) ?? NSURL()
    }
    
    public var path: String {
        switch self {
        case .shots(let id):
            
            guard let id = id else {
                return "/shots"
            }
            
            return "/shots/\(id)"
        }
    }
    
    public var method: Moya.Method {
        return .GET
    }
    
    public var parameters: [String : AnyObject]? {
        return ["access_token":(EnvironmentUtil.accessToken)]
    }
    
    public var sampleData: NSData {
        let filename: String
        
        switch self {
        case .shots(let id):
            
            if let id = id {
                filename = "shots\(id).json"
            } else {
                filename = "shots.json"
            }
            
        }
        
        if let sample = NSBundle.mainBundle().pathForResource(filename, ofType: nil) {
            return NSData(contentsOfFile: sample)!
        }
        
        return NSData()
    }
    
}

