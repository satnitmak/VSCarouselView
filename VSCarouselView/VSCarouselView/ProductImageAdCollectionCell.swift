//
//  ProductImageAdCollectionCell.swift
//  ICEKit
//
//  Created by Sathyanarayanan V on 8/31/17.
//  Copyright © 2017 Sathyanarayanan V. All rights reserved.
//

import UIKit

class ProductImageAdCollectionCell: UICollectionViewCell {
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var adImageView: UIImageView!
    @IBOutlet weak var adTitleLabel: UILabel!
    @IBOutlet weak var adDescriptionLabel: UILabel!
    @IBOutlet weak var adActionButton: UIButton!
    
    static let nibName: String = "ProductImageAdCollectionCell"
    static let reuseID: String = "ProductImageAdCollectionCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadowView.layer.cornerRadius = 5
        shadowView.layer.shadowOpacity = 0.24
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadowView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.cornerRadius = 5
    }
    
}
