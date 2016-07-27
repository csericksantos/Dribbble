//
//  ShotsViewControllerTest.swift
//  Dribbble
//
//  Created by Erick Santos on 7/27/16.
//  Copyright © 2016 Erick Santos. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import Dribbble

class ShotsViewControllerTest: QuickSpec {
    override func spec() {
        
        var viewController: ShotsViewController?
        var service: ShotServiceMock?
        
        beforeEach {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewControllerWithIdentifier("ShotsViewController") as? ShotsViewController
            
            viewController?.preloadView()
            service = ShotServiceMock()
        }
        
        describe("Valid ShotsViewController") {
            describe("Valid initialization") {
                
                it("service was not called") {
                    
                    expect(viewController?.view).toNot(beNil())
                    expect(viewController?.collectionView).toNot(beNil())
                    
                }
                
            }
            
            describe("valid empty state") {
                
                it("valid hidden table") {
                    
                    service?.callEmpty = true
                    
                    viewController?.getShots(fromService: service!)
                    
                    expect(viewController?.collectionView?.hidden).to(beTruthy())
                    
                }
                
            }
            
            describe("Valid tableView") {
                
                it("valid table Datasource") {
                    
                    viewController?.getShots(fromService: service!)
                    
                    let collectionView: UICollectionView? = viewController?.collectionView
                    
                    expect(viewController as? UICollectionViewDataSource).to(beTruthy())
                    expect(collectionView?.dataSource).toNot(beNil())
                    expect(viewController?.collectionView(collectionView!, numberOfItemsInSection: 0)).to(equal(2))
                    expect(viewController?.collectionView(collectionView!, cellForItemAtIndexPath: NSIndexPath.init(forRow: 0, inSection: 0))).toNot(beNil())
                    
                }
                
                it("valid tableViewCell") {
                    
                    viewController?.getShots(fromService: service!)
                    
                    let shotViewCell: ShotViewCell = viewController?.collectionView(viewController!.collectionView!, cellForItemAtIndexPath: NSIndexPath.init(forRow: 0, inSection: 0)) as! ShotViewCell
                    
                    expect(ShotViewCell.identifier()).to(equal(String(ShotViewCell)))
                    expect(shotViewCell.userImage).toNot(beNil())
                    expect(shotViewCell.userNameLabel).toNot(beNil())
                    expect(shotViewCell.userNameLabel?.text).to(equal("User 1"))
                    expect(shotViewCell.projectImage).toNot(beNil())
                    expect(shotViewCell.viewsLabel).toNot(beNil())
                    expect(shotViewCell.viewsLabel?.text).to(equal("10"))
                    expect(shotViewCell.commentsLabel).toNot(beNil())
                    expect(shotViewCell.commentsLabel?.text).to(equal("1000"))
                    expect(shotViewCell.heartsLabel).toNot(beNil())
                    expect(shotViewCell.heartsLabel?.text).to(equal("100"))
                    expect(shotViewCell.shot).toNot(beNil())
                    
                }
                
            }
            
        }
    }
}
