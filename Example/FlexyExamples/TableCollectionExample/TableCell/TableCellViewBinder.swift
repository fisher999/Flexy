//
//  TableCellViewBinder.swift
//  FlexyExamples
//
//  Created by Виктор on 18/08/2018.
//  Copyright © 2018 Flexy. All rights reserved.
//

import Foundation
import Flexy
import UIKit

class TableCellViewVinder:ViewBinder {
    typealias Model = TableCellsItemModel
    typealias Cell = CarTableCell
    
    
    func bind(model: TableCellsItemModel, to cell: CarTableCell) {
        cell.config = model.cellConfig
    }
    
    
    var cellIdentifier: String {
        return "TableCell"
    }
    
    
    
}
