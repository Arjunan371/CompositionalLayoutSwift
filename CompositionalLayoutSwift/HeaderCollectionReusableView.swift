//
//  HeaderCollectionReusableView.swift
//  CompositionalLayoutSwift
//
//  Created by Arjunan on 10/04/24.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
        static let headerIdentifier = "HeaderCollectionReusableView"
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Food"
        label.textAlignment = .left
        label.textColor = .black
        return label
        
    }()
    
    public func configure(index:IndexPath) {
   //     backgroundColor = UIColor.systemGreen
        if index.section == 1 {
            label.text = "good for health"
        } else {
            label.text = "section \(index.section)"
        }
        addSubview(label)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}

class FooterCollectionReusableView: UICollectionReusableView {
        static let footerIdentifier = "HeaderCollectionReusableView"
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Food"
        label.textAlignment = .left
        label.textColor = .black
        return label
        
    }()
    
    public func configure(index:IndexPath) {
   //     backgroundColor = UIColor.systemGreen
        if index.section == 1 {
            label.text = "good for health"
        } else {
            label.text = "section \(index.section + 1)"
        }
        addSubview(label)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
