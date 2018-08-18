//
//  CollectionViewBinder.swift
//  FlexyExamples
//
//  Created by Виктор on 12/08/2018.
//  Copyright © 2018 Flexy. All rights reserved.
//

import Flexy

class CollectionViewBinder: ViewBinder {
    private let clickHandler: ((ContactItemModel) -> ())?
    
    init(_ handler: ((ContactItemModel) -> ())? = nil) {
        clickHandler = handler
    }
    
    func bind(model: ContactItemModel, to cell: CollectionCellClass) {
        cell.contactNameLabel.text = model.name
        cell.contactPhotoImageView.image = model.photo
    }
    
    func onItemSelect(item: ContactItemModel) {
        clickHandler?(item)
    }
    
    var cellIdentifier: String {
        return "CollectionCell"
    }
    
    
    
    
    
    
}
