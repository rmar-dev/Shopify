//
//  VarianteCollectionViewCell.swift
//  myshopify
//
//  Created by Ricardo Rabeto on 19/01/2020.
//  Copyright © 2020 Ricardo Rabeto. All rights reserved.
//

import UIKit
import Hero

class VarianteCollectionViewCell: BaseViewCell {
    
    let image: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let options: UITextView = {
        let tf = UITextView()
        tf.isEditable = false
        tf.textContainer.lineBreakMode = .byWordWrapping
        tf.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    var variants: [Variants]? {
        didSet {
            if let variants = variants {
                var allTypes: String = ""
                variants.forEach { (value) in
                    if let type = value.title, let prc = value.price {
                        allTypes = "\(allTypes)\n \(type): \(prc)€"
                    }
                }
                options.text = allTypes
            }
            
        }
    }
    
    override func setupViewCell() {
        super.setupViewCell()
        buildConstraints()
        
    }
    
    // MARK: CONSTRAINTS
    
    fileprivate func buildConstraints() {
        
        addSubview(image)
        addSubview(title)
        addSubview(options)
        
        NSLayoutConstraint.activate([
            //TITLE CONSTRAINTS
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 20),
            title.heightAnchor.constraint(equalToConstant: 20),
            //IMAGE CONTAINER
            image.topAnchor.constraint(equalTo: topAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            //OPTIONS CONSTRAINTS
            options.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            options.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 20),
            options.rightAnchor.constraint(equalTo: rightAnchor),
            options.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
            
        ])
    }
}
