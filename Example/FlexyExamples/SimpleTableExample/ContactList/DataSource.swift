//
//  DataSource.swift
//  FlexyExamples
//
//  Created by Виктор on 11/08/2018.
//  Copyright © 2018 Flexy. All rights reserved.
//

import Foundation
import UIKit


class DataSource:UIViewController {
    
    var itemModels = [
        ContactItemModel(photo: UIImage(named: "avatar1")!, name: "Marie"),
        ContactItemModel(photo: UIImage(named: "avatar3")!, name: "Benjamin"),
        ContactItemModel(photo: UIImage(named: "avatar1")!, name: "Sofia"),
        ContactItemModel(photo: UIImage(named: "avatar2")!, name: "Barry"),
        ContactItemModel(photo: UIImage(named: "avatar1")!, name: "Elizabeth"),
        ContactItemModel(photo: UIImage(named: "avatar1")!, name: "Chloe"),
        ContactItemModel(photo: UIImage(named: "avatar3")!, name: "Brian"),
        ContactItemModel(photo: UIImage(named: "avatar2")!, name: "Corwin"),
        ContactItemModel(photo: UIImage(named: "avatar3")!, name: "Christopher"),
        ]
    
    func getData() -> [ContactItemModel]{
        return itemModels
    }
    
}
