//
//  BaseViewController.swift
//  myshopify
//
//  Created by Ricardo Rabeto on 18/01/2020.
//  Copyright © 2020 Ricardo Rabeto. All rights reserved.
//

import Foundation
import UIKit
class BaseClass: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    //MARK: PROPERTIES
    let cellId = "cellid"
    var cellWidth: CGFloat = 0
    var cellHeight: CGFloat = 0
    lazy var cellType = BaseViewCell.self
    var itemCouter: Int = 0
    
    lazy var size = (width: cellWidth, height: cellHeight)
    
    let topLogo: TopLogoView = {
        let view = TopLogoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //remove space in layout and place nav and tab colors
        initialSetup()
        
        self.collectionView.register(cellType, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = .white
        
        collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        
        let rc = UIRefreshControl()
        rc.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        collectionView.refreshControl = rc
        
    }
    
    //MARK: ACTIONS
    @objc func handleRefresh() {
        collectionView.reloadData()
        collectionView.refreshControl?.endRefreshing()
    }
    
    //MARK: METHODS
    func initialSetup(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView.collectionViewLayout = layout
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backItem?.title = ""
        
        
    }
    
    func addConstraints(_ viewBase: UICollectionReusableView) {
        viewBase.addSubview(topLogo)
        NSLayoutConstraint.activate([
            topLogo.centerYAnchor.constraint(equalTo: viewBase.centerYAnchor),
            topLogo.centerXAnchor.constraint(equalTo: viewBase.centerXAnchor),
            topLogo.widthAnchor.constraint(equalToConstant: 120),
            topLogo.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    //MARK: COLLECTION VIEW SETUP
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCouter
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
            
            headerView.backgroundColor = UIColor.white
            addConstraints(headerView)
            
            return headerView
            
        default:
            assert(false, "Unexpected element kind")
        }
    }
   
}
