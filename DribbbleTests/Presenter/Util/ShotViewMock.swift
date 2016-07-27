//
//  ShotViewMock.swift
//  Dribbble
//
//  Created by Erick Santos on 7/27/16.
//  Copyright © 2016 Erick Santos. All rights reserved.
//

import Foundation
@testable import Dribbble

class ShotViewMock: ShotsView {
    
    var wasLoading = false
    var dataSource: [Shot]? = nil
    var messageError: String? = nil
    var showError = false
    var hideEmptyView = true
    
    
    func showLoading() {
        wasLoading = true
    }
    
    func hideLoading() {
        wasLoading = false
    }
    
    func showError(message: String) {
        messageError = message
    }
    
    func setShots(shots: [Shot]) {
        dataSource = shots
    }
    
    func showEmptyView() {
        hideEmptyView = false
    }
    
}
