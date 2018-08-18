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

class ContactTableCell:UITableViewCell,CollectionBinder {
    
    @IBOutlet weak var myCollectionView:UICollectionView!
    var collectionCellController:CollectionCellController!
    func initCollectionCellController(numberOfColumns: Int, itemSpacing: ItemSpacing) -> CollectionCellController {
        let size = CGSize(width: myCollectionView.frame.width, height: 90)
        collectionCellController = CollectionCellController(collectionView: self.myCollectionView, with: [], cellSize: size, columns: numberOfColumns, itemSpacing: itemSpacing)
        return collectionCellController
    }
}
   
   
    
    
    
    
    
    
    
   

