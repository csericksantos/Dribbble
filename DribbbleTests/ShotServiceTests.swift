//
//  DribbbleTests.swift
//  DribbbleTests
//
//  Created by Erick Santos on 7/20/16.
//  Copyright © 2016 Erick Santos. All rights reserved.
//

import Moya
import Quick
import Nimble
import OHHTTPStubs
import Alamofire
@testable import Dribbble

class ShotServiceTests: QuickSpec {
    override func spec() {
        
        let service: ShotService = ShotService()
        
        describe("valid shot endpoints") {
            
            describe("a success service") {
                
                beforeEach {
                    
                    OHHTTPStubs.stubRequestsPassingTest({$0.URL!.path == "/shots?access_token=f4cb69f89faf10f3a3138f348a171819c5e9223d135580e9a12644de79af53af"}) { _ in
                        return OHHTTPStubsResponse(data: BaseAPI.shots(id: nil).sampleData, statusCode: 200, headers: nil)
                    }
                }
                
                it("returns data for shot request") {
                    var shots: [Shot] = []
                    
                    waitUntil { done in
                        service.get({ result in
                            
                            switch result {
                            case .success(let shotsResponse):
                                shots = shotsResponse
                                done()
                            case .failure(_):
                                done()
                            }
                            
                        })
                    }
                    
                    let shot = shots.first
                    
                    expect(shots.count).to(equal(2))
                    expect(shot?.title).to(equal("CRM - Dashboard+"))
                    expect(shot?.view).to(equal(1794))
                    expect(shot?.like).to(equal(214))
                    expect(shot?.comment).to(equal(14))
                    expect(shot?.description).to(contain("Sharing some more screens"))
                    expect(shot?.images).toNot(beNil())
                    expect(shot?.user).toNot(beNil())
                    
                }
                
                afterEach {
                    OHHTTPStubs.removeAllStubs()
                }
            }
            
            describe("a status failure service") {
                
                beforeEach {
                    
                    OHHTTPStubs.stubRequestsPassingTest({$0.URL!.path == "/shots?access_token=f4cb69f89faf10f3a3138f348a171819c5e9223d135580e9a12644de79af53af"}) { _ in
                        return OHHTTPStubsResponse(data: BaseAPI.shots(id: nil).sampleData, statusCode: 401, headers: nil)
                    }
                }
                
                it("returns succes 401 for shot request") {
                    var errors: Errors? = nil
                    
                    waitUntil { done in
                        service.get({ result in
                            
                            switch result {
                            case .success(_):
                                done()
                            case .failure(let error):
                                errors = error
                                done()
                            }
                            
                        })
                    }
                    
                    expect(errors).toNot(beNil())
                    expect(errors?.message()).to(equal("Não autorizado"))
                    
                }
            }
            
            afterEach {
                OHHTTPStubs.removeAllStubs()
            }
        }
        
        describe("a failure parse service") {
            
            beforeEach {
                
                OHHTTPStubs.stubRequestsPassingTest({$0.URL!.path == "/shots?access_token=f4cb69f89faf10f3a3138f348a171819c5e9223d135580e9a12644de79af53af"}) { _ in
                    return OHHTTPStubsResponse(data: "{}".dataUsingEncoding(NSUTF8StringEncoding)!, statusCode: 200, headers: nil)
                }
            }
            
            it("returns error for shot request") {
                var errors: Errors? = nil
                
                waitUntil { done in
                    service.get({ result in
                        
                        switch result {
                        case .success(_):
                            done()
                        case .failure(let error):
                            errors = error
                            done()
                        }
                        
                    })
                }
                
                expect(errors).toNot(beNil())
                expect(errors?.message()).to(equal("Não foi possível Mapear o JSON"))
                
            }
            
            afterEach {
                OHHTTPStubs.removeAllStubs()
            }
        }
        
        describe("a undefined failure parse service") {
            
            beforeEach {
                
                OHHTTPStubs.stubRequestsPassingTest({$0.URL!.path == "/shots?access_token=f4cb69f89faf10f3a3138f348a171819c5e9223d135580e9a12644de79af53af"}) { _ in
                    return OHHTTPStubsResponse(data: NSData(), statusCode: 200, headers: nil)
                }
            }
            
            it("returns error for shot request") {
                var errors: Errors? = nil
                
                waitUntil { done in
                    service.get({ result in
                        
                        switch result {
                        case .success(_):
                            done()
                        case .failure(let error):
                            errors = error
                            done()
                        }
                        
                    })
                }
                
                expect(errors).toNot(beNil())
                expect(errors?.message()).to(equal("Ops! Algo deu errado."))
                
            }
            
            afterEach {
                OHHTTPStubs.removeAllStubs()
            }
        }
    
        describe("a undefined failure parse service") {
            
            beforeEach {
                
                OHHTTPStubs.stubRequestsPassingTest({$0.URL!.path == "/shots?access_token=f4cb69f89faf10f3a3138f348a171819c5e9223d135580e9a12644de79af53af"}) { _ in
                    return OHHTTPStubsResponse(error: NSError(domain: "Error domain", code: 401, userInfo: nil))
                }
            }
            
            it("returns error for shot request") {
                var errors: Errors? = nil
                
                waitUntil { done in
                    service.get({ result in
                        
                        switch result {
                        case .success(_):
                            done()
                        case .failure(let error):
                            errors = error
                            done()
                        }
                        
                    })
                }
                
                expect(errors).toNot(beNil())
                expect(errors?.message()).to(equal("Ops! Algo deu errado."))
                
            }
            
            afterEach {
                OHHTTPStubs.removeAllStubs()
            }
        }
        
    }
    
}
