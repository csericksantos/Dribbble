//
//  ShotViewCell.swift
//  Dribbble
//
//  Created by Erick Santos on 7/25/16.
//  Copyright © 2016 Erick Santos. All rights reserved.
//

import UIKit

class ShotViewCell: UICollectionViewCell {

    @IBOutlet var backView: UIView?
    @IBOutlet var shotImage: UIImageView?
    @IBOutlet var shotNameLabel: UILabel?
    @IBOutlet var shotPriceLabel: UILabel?
    
    var product: Shot? {
        didSet {
            
            if let product = product,
                let photos = product.photos,
                let imageURL = photos.thumbnailHD {
                productImage?.downloadImage(URL: imageURL.secureURL)
            }
            
            productNameLabel?.text = product?.title
            productPriceLabel?.text = product?.currencyPrice()
            productDateLabel?.text = product?.stringDate()
            
        }
    }
    
    static func identifier() -> String {
        return String(ProductViewCell)
    }
    
}
