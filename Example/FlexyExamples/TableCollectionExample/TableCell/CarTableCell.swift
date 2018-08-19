//
//  TableCell.swift
//  FlexyExamples
//
//  Created by Виктор on 13/08/2018.
//  Copyright © 2018 Flexy. All rights reserved.
//

import Foundation
import Flexy
import UIKit

class CarTableCell:UITableViewCell {
    @IBOutlet weak var myCollectionView:UICollectionView!
    var collectionCellController:CollectionCellController!
    var config:CellConfiguration!
    func initCollectionCellController(){
        collectionCellController = CollectionCellController(collectionView: self.myCollectionView, with: [], cellConfig: config)
    }
}
   
   
    
    
    
    
    
    
    
   

