//
//  CollectionCellClass.swift
//  FlexyExamples
//
//  Created by Виктор on 12/08/2018.
//  Copyright © 2018 Flexy. All rights reserved.
//

import UIKit

class CollectionCellClass: UICollectionViewCell{
    @IBOutlet var carPhotoImageView: UIImageView!
    @IBOutlet var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        carPhotoImageView.layer.cornerRadius = 25
        carPhotoImageView.layer.masksToBounds = true
    }
}
