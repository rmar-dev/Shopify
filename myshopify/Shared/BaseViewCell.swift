//
//  BaseViewCell.swift
//  myshopify
//
//  Created by Ricardo Rabeto on 18/01/2020.
//  Copyright © 2020 Ricardo Rabeto. All rights reserved.
//

import UIKit

class BaseViewCell: UICollectionViewCell {
    
    //MARK: PROPERTIES
    lazy var borderBottom: UIView = {
        return createBorderView()
    }()
    
    lazy var borderTop: UIView = {
        return createBorderView()
    }()
    
    func createBorderView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isOpaque = false
        return view
    }
    
    
    // MARK: LIFECYCLE
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViewCell()        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewCell() {
        addSubview(borderBottom)
        addSubview(borderTop)
        NSLayoutConstraint.activate([
            // Border Top
            borderTop.heightAnchor.constraint(equalToConstant: 1),
            borderTop.widthAnchor.constraint(equalTo: widthAnchor),
            borderTop.bottomAnchor.constraint(equalTo: topAnchor),
            // Border Bottom
            borderBottom.heightAnchor.constraint(equalToConstant: 1),
            borderBottom.widthAnchor.constraint(equalTo: widthAnchor),
            borderBottom.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
