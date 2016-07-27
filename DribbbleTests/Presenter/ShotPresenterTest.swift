//
//  ShotPresenterTest.swift
//  Dribbble
//
//  Created by Erick Santos on 7/27/16.
//  Copyright © 2016 Erick Santos. All rights reserved.
//

import Moya
import Quick
import Nimble
import OHHTTPStubs
import Alamofire
@testable import Dribbble

class ShotPresenterTest: QuickSpec {
    override func spec() {
        
        let presenter: ShotPresenter = ShotPresenter()
        let service: ShotServiceMock = ShotServiceMock()
        var view: ShotViewMock = ShotViewMock()
        
        describe("Valid presenter") {
            describe("Valid Service from Presenter") {
                
                it("service was not called") {
                    
                    expect(service.wasCalled).to(equal(false))
                    
                }
                
                it("service was called with success") {
                    
                    presenter.getShots(fromService: service)
                    
                    expect(service.wasCalled).to(equal(true))
                    
                }
                
            }
            
            describe("Valid View from Presenter") {
                
                beforeEach {
                    view = ShotViewMock()
                    presenter.setView(view)
                }
                
                it("valid show view") {
                    
                    presenter.getShots(fromService: service)
                    
                    expect(view.hideEmptyView).to(equal(true))
                    expect(view.wasLoading).to(equal(false))
                    expect(view.dataSource).toNot(beNil())
                    expect(view.dataSource?.count).to(equal(2))
                    
                }
                
                it("valid empty view") {
                    service.callEmpty = true
                    
                    presenter.getShots(fromService: service)
                    
                    expect(view.hideEmptyView).to(equal(false))
                    expect(view.wasLoading).to(equal(false))
                    expect(view.dataSource).to(beNil())
                    
                }
                
                it("valid failure message") {
                    service.callError = true
                    
                    presenter.getShots(fromService: service)
                    
                    expect(view.messageError).to(equal("Testando falha"))
                    expect(view.hideEmptyView).to(equal(false))
                    expect(view.wasLoading).to(equal(false))
                    expect(view.dataSource).to(beNil())
                    
                }
                
            }
            
        }
    }
}

