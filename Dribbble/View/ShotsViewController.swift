//
//  ViewController.swift
//  Dribbble
//
//  Created by Erick Santos on 7/20/16.
//  Copyright © 2016 Erick Santos. All rights reserved.
//

import UIKit
import PKHUD

class ShotsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView?
    
    private let shotService = ShotService()
    private let shotPresenter = ShotPresenter()
    private var dataSource = [Shot]() {
        didSet {
            if let collectionView = collectionView {
                collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shotPresenter.setView(self)
        getShots(fromService: shotService)
        
    }
    
    func getShots<Service: Gettable where Service.DataArray == [Shot]>(fromService service: Service) {
        shotPresenter.getShots(fromService: service)
    }

}

extension ShotsViewController: ShotsView {
    
    
    func showLoading() {
        HUD.show(.Progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
    
    func showError(message: String) {
        HUD.flash(.Label(message), delay: 3.0) { _ in
        }
    }
    
    func setShots(shots: [Shot]) {
        collectionView?.hidden = false
        dataSource = shots
    }
    
    func showEmptyView() {
        collectionView?.hidden = true
    }
    
}

extension ShotsViewController: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: ShotViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(ShotViewCell.identifier(), forIndexPath: indexPath) as! ShotViewCell
        
        cell.shot = dataSource[indexPath.row]
        
        return cell
    }
    
}

extension ShotsViewController: UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(ceil(self.view.bounds.width/2), ceil(self.view.bounds.width/2))
    }
    
}
