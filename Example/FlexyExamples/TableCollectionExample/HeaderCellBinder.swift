//
//  HeaderCellBinder.swift
//  FlexyExamples
//
//  Created by Виктор on 17/08/2018.
//  Copyright © 2018 Flexy. All rights reserved.
//

import Foundation
import Flexy

class HeaderCellBinder:ViewBinder {
    typealias Model = HeaderItemModel
    typealias Cell = HeaderCell
    
    func bind(model: HeaderItemModel, to cell: HeaderCell) {
        cell.title.text = model.title
    }
    
    
    var cellIdentifier: String {
        return "HeaderCell"
    }

}
