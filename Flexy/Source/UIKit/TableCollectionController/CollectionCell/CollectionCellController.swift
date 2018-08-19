//
//  CollectionCellController.swift
//  Flexy
//
//  Created by Виктор on 03/08/2018.
//  Copyright © 2018 Aleksey Anisov. All rights reserved.
//

import UIKit

public class CollectionCellController: AbstractController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    public weak var collectionView:UICollectionView?
    var cellConfig:CellConfiguration!
    var width:CGFloat!
    var height:CGFloat!
    public var universalDelegateHandler:MultiDelegatesProxy!
    
    
    public init(collectionView:UICollectionView,with delegateArray:[Any],cellConfig:CellConfiguration){
        super.init()
        self.collectionView = collectionView
        self.cellProvider = collectionView
        universalDelegateHandler = MultiDelegatesProxy.newProxy(withMainDelegate: self, other: delegateArray)
        self.collectionView?.delegate = universalDelegateHandler as? UICollectionViewDelegate
        self.collectionView?.dataSource = self
        self.cellConfig = cellConfig
        if !cellConfig.scrollable {
            collectionView.isScrollEnabled = false
        }
        else {
            collectionView.isScrollEnabled = true
        }
        let layout = collectionView.collectionViewLayout as!UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = cellConfig.itemSpacing.minInteritemSpacing
        layout.minimumLineSpacing = cellConfig.itemSpacing.minLineSpacing
        collectionView.collectionViewLayout = layout
        self.width = (self.collectionView?.frame.width)!/CGFloat(self.cellConfig.columns) - cellConfig.itemSpacing.minInteritemSpacing
        self.height = (self.cellConfig.cellSize.height)
    }
    
    public override var itemModels: [ItemModel] {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    public func addDelegate(delegate:Any) {
        universalDelegateHandler.addDelegate(delegate)
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemModels.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return reuseCell(for: Flexy.Index(section: indexPath.section, item: indexPath.row), from: cellProvider! )
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didClickOnItem(on: Flexy.Index(section: indexPath.section, item: indexPath.row))
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.width   , height: self.height)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
