//
//  TopLogoView.swift
//  myshopify
//
//  Created by Ricardo Rabeto on 19/01/2020.
//  Copyright © 2020 Ricardo Rabeto. All rights reserved.
//

import UIKit

class TopLogoView: UIView {
    
    let bagView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "BagTopIcon" )
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        lbl.text = "Select a Tag"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints() {
        addSubview(bagView)
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            bagView.centerYAnchor.constraint(equalTo: centerYAnchor),
            bagView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bagView.heightAnchor.constraint(equalToConstant: 50),
            // title label
            titleLabel.topAnchor.constraint(equalTo: bagView.bottomAnchor, constant: 5),
            titleLabel.centerXAnchor.constraint(equalTo: bagView.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 15),

        ])
    }
    
    
}
