//
//  EnvironmentUtil.swift
//  Dribbble
//
//  Created by Erick Santos on 7/21/16.
//  Copyright © 2016 Erick Santos. All rights reserved.
//

import Foundation

struct EnvironmentUtil {
    
    private static var environmentDictonary: Dictionary<String, AnyObject>? {
        get {
            
            guard let dict: Dictionary<String, AnyObject> = NSBundle.mainBundle().infoDictionary?["LSEnvironment"] as? Dictionary<String, AnyObject> else {
                return nil
            }
            
            return dict
        }
    }
    
    static var baseURL: String! {
        get {
            
            guard let baseURL = environmentDictonary?["BASE_URL"] as? String else {
                return ""
            }
            
            return baseURL
        }
    }
    
    static var accessToken: String! {
        get {
            
            guard let accessToken = environmentDictonary?["ACCESS_TOKEN"] as? String else {
                return ""
            }
            
            return accessToken
        }
    }
}
