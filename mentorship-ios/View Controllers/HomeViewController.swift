//
//  HomeViewController.swift
//  mentorship-ios
//
//  Created by Vatsal Kulshreshtha on 19/04/20.
//  Copyright © 2020 Vatsal Kulshreshtha. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    let requests = ["Pending", "Accepted", "Rejected", "Completed" ]
    let counts = [0,1,1,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let height = collectionView.collectionViewLayout.collectionViewContentSize.height
        collectionViewHeightConstraint.constant = height
    }

}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 15) / 2
        return CGSize(width: size, height: size-50)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCollectionViewCell
        cell.countLabel.text = String(counts[indexPath.row])
        cell.requestLabel.text = requests[indexPath.row]
        cell.bgView.layer.cornerRadius = 15
        if cell.countLabel.text == "0" {
            cell.bgView.alpha = 0.75
        }
        
        return cell
    }
    
}
