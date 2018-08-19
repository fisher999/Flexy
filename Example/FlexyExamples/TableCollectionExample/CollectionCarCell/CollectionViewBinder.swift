//
//  CollectionViewBinder.swift
//  FlexyExamples
//
//  Created by Виктор on 12/08/2018.
//  Copyright © 2018 Flexy. All rights reserved.
//

import Flexy

class CollectionViewBinder: ViewBinder {
    private let clickHandler: ((CarItemModel) -> ())?
    private var itemModels:[ItemModel]!
    
    init(_ handler: ((CarItemModel) -> ())? = nil) {
        clickHandler = handler
    }
    
    func bind(model: CarItemModel, to cell: CollectionCellClass) {
        cell.priceLabel.text = model.price
        cell.carPhotoImageView.image = model.photo
    }
    
    func onItemSelect(item: CarItemModel) {
        clickHandler?(item)
    }
    
    var cellIdentifier: String {
        return "CollectionCell"
    }
    
    
    
    
    
    
}
