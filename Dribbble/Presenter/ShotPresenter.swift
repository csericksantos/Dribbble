//
//  ShotPresenter.swift
//  Dribbble
//
//  Created by Erick Santos on 7/25/16.
//  Copyright © 2016 Erick Santos. All rights reserved.
//

import Foundation

class ShotPresenter {
    weak private var shotsView: ShotsView?
    
    func setView(shotsView: ShotsView) {
        self.shotsView = shotsView
    }
    
    func getShots<Service: Gettable where Service.DataArray == [Shot]>(fromService service: Service) {
        shotsView?.showLoading()
        
        service.get { result in
            
            switch result {
                
            case .success(let shots):
                if shots.isEmpty {
                    self.shotsView?.showEmptyView()
                    self.shotsView?.hideLoading()
                } else {
                    self.shotsView?.setShots(shots)
                    self.shotsView?.hideLoading()
                }
            case .failure(let error):
                self.shotsView?.showError(error.message())
                self.shotsView?.showEmptyView()
                self.shotsView?.hideLoading()
            }
            
        }
    }
    
}
