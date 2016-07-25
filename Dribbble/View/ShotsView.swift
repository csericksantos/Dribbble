//
//  ShotsView.swift
//  Dribbble
//
//  Created by Erick Santos on 7/25/16.
//  Copyright © 2016 Erick Santos. All rights reserved.
//

import Foundation

protocol ShotsView: AnyObject {
    func showLoading()
    func hideLoading()
    func showError(message: String)
    func setShots(shots: [Shot])
    func showEmptyView()
}
