//
//  VariantCollectionViewController.swift
//  myshopify
//
//  Created by Ricardo Rabeto on 19/01/2020.
//  Copyright © 2020 Ricardo Rabeto. All rights reserved.
//

import UIKit
import Hero
import Kingfisher

class VariantCollectionViewController: BaseClass {
    // MARK: PROPERTIES
    var panGR: UIPanGestureRecognizer!
    let dismissButton = UIButton(type: .system)
    var listOfProduts: [Products]?
    
    // MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        panGR = UIPanGestureRecognizer(target: self,
                                       action: #selector(handlePan(gestureRecognizer:)))
        view.addGestureRecognizer(panGR)
        
        self.collectionView!.register(VarianteCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        addDismissButton()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        dismissButton.sizeToFit()
        dismissButton.center = CGPoint(x: 30, y: 100)
    }
    
    //MARK: METHODS
    override func initialSetup() {
        super.initialSetup()
        self.hero.isEnabled = true
        collectionView.hero.modifiers = [.cascade]
        
        // cell setup
        cellWidth = UIScreen.main.bounds.width
        cellHeight = 150
        // Do any additional setup after loading the view.
        collectionView.backgroundColor = .white
        itemCouter = listOfProduts?.count ?? 0
        
        
    }
    
    private func addDismissButton() {
        dismissButton.setTitle("", for: .normal)
        dismissButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        let image = UIImage(named: "back")
        image?.withRenderingMode(.alwaysTemplate)
        dismissButton.setImage(image, for: .normal)
        dismissButton.tintColor = UIColor.init(hexa: ApplicationColors.primary_orange)
        dismissButton.hero.id = "back button"
        view.addSubview(dismissButton)
        
    }
    
    
    
    // MARK: ACTIONS OBJC
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func onTap() {
        back() // default action is back on tap
    }
    
    @objc func handlePan(gestureRecognizer:UIPanGestureRecognizer) {
        switch panGR.state {
        case .began:
            // begin the transition as normal
            dismiss(animated: true, completion: nil)
        case .changed:
            // calculate the progress based on how far the user moved
            let translation = panGR.translation(in: nil)
            let progress = translation.y / 2 / view.bounds.height
            Hero.shared.update(progress)
        default:
            // end the transition when user ended their touch
            Hero.shared.finish()
        }
    }
}

// MARK: CELL CONFIGURATIONS

extension VariantCollectionViewController {
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100.0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! VarianteCollectionViewCell
        if let content = listOfProduts?[indexPath.item] {
            cell.title.text = content.title
            cell.variants = content.variants
            if let path = content.images?[0].src, let url = URL(string: path){
                cell.image.kf.setImage(with: url, options: [.transition(.fade(0.5))])
            }
        }
        cell.hero.modifiers = [.fade, .scale(0.5)]
        cell.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        cell.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return cell
    }
    
    
   
}




