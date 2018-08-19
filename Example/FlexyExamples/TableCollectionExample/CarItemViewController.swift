//
//  CarItemViewController.swift
//  FlexyExamples
//
//  Created by Виктор on 19/08/2018.
//  Copyright © 2018 Flexy. All rights reserved.
//

import UIKit

class CarItemViewController: UIViewController {
    
    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var priceLabel: UILabel!
    
    var price: String? {
        didSet {
            priceLabel.text = price
        }
    }
    
    var avatarImage: UIImage? {
        didSet {
            avatarImageView.image = avatarImage
        }
    }
    
}
