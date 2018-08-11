//
//  CollectionCellController.swift
//  Flexy
//
//  Created by Виктор on 03/08/2018.
//  Copyright © 2018 Aleksey Anisov. All rights reserved.
//

import UIKit

public class CollectionCellController: AbstractController,UICollectionViewDelegate,UICollectionViewDataSource {

    public weak var collectionView:UICollectionView?
    
    public init(collectionView:UICollectionView){
        super.init()
        self.collectionView = collectionView
        self.cellProvider = collectionView
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
    }
    
    public override var itemModels: [ItemModel] {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemModels.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return reuseCell(for: Flexy.Index(section: indexPath.section, item: indexPath.row), from: cellProvider! )

    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didClickOnItem(on: Flexy.Index(section: indexPath.section, item: indexPath.row))
    }
    
    
    
    
    
    
    
}
