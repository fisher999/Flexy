//
//  TableCollectionController.swift
//  Flexy
//
//  Created by Виктор on 03/08/2018.
//  Copyright © 2018 Aleksey Anisov. All rights reserved.
//

import Foundation
import UIKit

public class TableCollectionController:AbstractController, UITableViewDelegate, UITableViewDataSource {
    
    
    private weak var tableView: UITableView?
    private weak var collectionView: UICollectionView?
    public var collectionItemModels:[[ItemModel]]!{
        didSet {
            tableView?.reloadData()
        }
    }
    
    private lazy var collectionCellController = CollectionCellController(collectionView: collectionView!)
   
    public init(tableView:UITableView,collectionView:UICollectionView){
        super.init()
        self.tableView = tableView
        self.cellProvider = tableView
        
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectionItemModels.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return reuseCell(for: Flexy.Index(section: indexPath.section, item: indexPath.row), from: tableView)
    }
    
    
    
    
}
