//
//  UIImage.swift
//  Dribbble
//
//  Created by Erick Santos on 7/26/16.
//  Copyright © 2016 Erick Santos. All rights reserved.
//

import UIKit
import Alamofire

extension UIImageView {
    
    func downloadImage (URL url: NSURL?) {
        
        guard let url = url else {
            return;
        }
        
        self.image = UIImage.init()
        Alamofire.request(.GET, url).response {
            (_, _, data, _) in
            self.image = UIImage(data: data!)
        }
    }
    
}
