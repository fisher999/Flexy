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
    var columns:Int!
    var itemSpacing:ItemSpacing!
    var cellSize: CGSize!
    
    public var universalDelegateHandler:MultiDelegatesProxy!
    public init(collectionView:UICollectionView,with delegateArray:[Any],cellSize:CGSize,columns:Int,itemSpacing:ItemSpacing){
        super.init()
        self.collectionView = collectionView
        self.cellProvider = collectionView
        universalDelegateHandler = MultiDelegatesProxy.newProxy(withMainDelegate: self, other: delegateArray)
        self.collectionView?.delegate = universalDelegateHandler as? UICollectionViewDelegate
        self.collectionView?.dataSource = self
        self.cellSize = cellSize
        self.columns = columns
        self.itemSpacing = itemSpacing
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
        print(itemModels.count)
        return itemModels.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return reuseCell(for: Flexy.Index(section: indexPath.section, item: indexPath.row), from: cellProvider! )

    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didClickOnItem(on: Flexy.Index(section: indexPath.section, item: indexPath.row))
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.collectionView?.frame.width)! / CGFloat(self.columns)   , height: self.cellSize.height)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
