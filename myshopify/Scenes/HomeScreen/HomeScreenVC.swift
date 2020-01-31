//
//  HomeScreenVC.swift
//  myshopify
//
//  Created by Ricardo Rabeto on 18/01/2020.
//  Copyright © 2020 Ricardo Rabeto. All rights reserved.
//

import UIKit
import Hero

class HomeScreenVC: BaseClass {
    
    var list: Set<String>?

    override func viewDidLoad() {
        super.viewDidLoad()
        cellWidth = 200
        cellHeight = 120
       
    }
    
    override func initialSetup() {
        super.initialSetup()
        self.hero.isEnabled = true
        topLogo.bagView.hero.id = "splashScreen"
        view.backgroundColor = .white
        cellType = HomeBadgViewCell.self
        itemCouter = list?.count ?? 0
    }
    
}

extension HomeScreenVC {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100.0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeBadgViewCell
        if let mySet = list {
            let title = mySet[mySet.index(mySet.startIndex, offsetBy: indexPath.item)]
            cell.badgTitle.text = title
            cell.badget.image = UIImage(named: title)
        }
        
        cell.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        cell.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let vc = VariantCollectionViewController(collectionViewLayout: layout)
        
        var filter = ""
        if let mySet = list {
            filter = mySet[mySet.index(mySet.startIndex, offsetBy: indexPath.item)]
        }
        vc.listOfProduts = SharedConstants.shared.products?.filter({ (prod) -> Bool in
            (prod.tags?.contains(filter) ?? false)
        })
        // setup hero
        vc.hero.isEnabled = true
        vc.topLogo.bagView.image = UIImage(named: filter)
        vc.topLogo.titleLabel.text = filter
        vc.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoomOut)
        
        // lastly, present the view controller like normal
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}
