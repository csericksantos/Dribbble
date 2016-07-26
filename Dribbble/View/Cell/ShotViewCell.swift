//
//  ShotViewCell.swift
//  Dribbble
//
//  Created by Erick Santos on 7/25/16.
//  Copyright © 2016 Erick Santos. All rights reserved.
//

import UIKit

class ShotViewCell: UICollectionViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var projectImage: UIImageView!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var heartsLabel: UILabel!
    
    var shot: Shot? {
        didSet {
            
            guard let shot = shot else {
                return;
            }
            
            userImage.downloadImage(URL: shot.user?.avatar)
            userNameLabel.text = shot.user?.name
            
            projectImage.downloadImage(URL: shot.images?.normal)
            viewsLabel.text = String(shot.view!)
            commentsLabel.text = String(shot.comment!)
            heartsLabel.text = String(shot.like!)
            
        }
    }
    
    static func identifier() -> String {
        return String(ShotViewCell)
    }
    
}
