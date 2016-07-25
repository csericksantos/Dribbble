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

    @IBOutlet weak var tableView: UITableView?
    
    private let productService = ShotService()
    private let productPresenter = ShotPresenter()
    private var dataSource = [Shot]() {
        didSet {
            if let tblView = tableView {
                tblView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        tableView?.hidden = false
        dataSource = shots
    }
    
    func showEmptyView() {
        tableView?.hidden = true
    }
    
}

extension ShotsViewController: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: ShotViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(ShotViewCell.identifier(), forIndexPath: indexPath) as! ShotViewCell
        
        cell.product = dataSource[indexPath.row]
        
        return cell
    }
    
}

extension ShotsViewController: UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(ceil(self.view.bounds.width/2), ceil(self.view.bounds.width/2))
    }
    
}
