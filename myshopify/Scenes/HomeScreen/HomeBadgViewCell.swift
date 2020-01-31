//
//  HomeBadgViewCell.swift
//  myshopify
//
//  Created by Ricardo Rabeto on 18/01/2020.
//  Copyright © 2020 Ricardo Rabeto. All rights reserved.
//

import UIKit
import Hero

class HomeBadgViewCell: BaseViewCell {
    
    var badget: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 25
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    var badgTitle: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    
    override func setupViewCell() {
        super.setupViewCell()
        addConstraints()
        hero.id = "badget"
    }
    
    func addConstraints() {
        addSubview(badget)
        addSubview(badgTitle)

        NSLayoutConstraint.activate([
            badget.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            badget.centerXAnchor.constraint(equalTo: centerXAnchor),
            badget.widthAnchor.constraint(equalToConstant: 50),
            badget.heightAnchor.constraint(equalToConstant: 50),
            
            //title label
            badgTitle.topAnchor.constraint(equalTo: badget.bottomAnchor, constant: 2),
            badgTitle.bottomAnchor.constraint(equalTo: bottomAnchor),
            badgTitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            badgTitle.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
