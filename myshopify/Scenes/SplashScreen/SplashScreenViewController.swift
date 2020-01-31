//
//  SplashScreenViewController.swift
//  myshopify
//
//  Created by Ricardo Rabeto on 18/01/2020.
//  Copyright © 2020 Ricardo Rabeto. All rights reserved.
//

import UIKit
import Hero

class SplashScreenViewController: UIViewController {
    
    // MARK: PROPERTIES
    let bagView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "BagIconSmall" )
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    let loading: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        lbl.text = "Loading Tags..."
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    // MARK: LYFECICLE
    convenience init() {
        self.init(nibName:nil, bundle:nil)
        bagView.hero.id = "splashScreen"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexa: ApplicationColors.splash_screen_background)
        addSplashImage()
        
        NetworkManager.shared.listRequest(endPoint: .products(page: 1)) {[weak self] (prod) in
            if let prodList = prod{
                SharedConstants.shared.products = prodList.products
                var listSet: Set<String> = []
                prodList.products.forEach { (value) in
                    let tags = value.tags?.split(separator: ",")
                    tags?.forEach({ (sub) in
                        let trimString = String(sub).trimmingCharacters(in: .whitespacesAndNewlines)
                        listSet.insert(trimString)
                    })
                    
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
                   let layout = UICollectionViewFlowLayout()
                   layout.scrollDirection = .vertical
                   let vc = HomeScreenVC(collectionViewLayout: layout)
                   vc.list = listSet
                   vc.hero.isEnabled = true
                   self?.navigationController?.pushViewController(vc, animated: true)                }
                
            }
            
        }
    }
    
    
    // MARK: METHODS
    
    private func addSplashImage() {
        view.addSubview(bagView)
        view.addSubview(loading)
        
        NSLayoutConstraint.activate([
            bagView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bagView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bagView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            //loading Label
            loading.topAnchor.constraint(equalTo: bagView.bottomAnchor, constant: 10),
            loading.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loading.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        
    }
    
    
}
