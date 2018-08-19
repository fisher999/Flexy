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
    private var cellsHeight = [CGFloat]()
    private var delegateArray:[Any]!
    private var cells = [UITableViewCell]()
    private var spaceBetweenCells = [CGFloat]()
    public var universalDelegateHandler: MultiDelegatesProxy?
    public override var itemModels: [ItemModel] {
        didSet {
            tableView?.reloadData()
        }
    }
    
   
    public init(tableView:UITableView,with delegateArray:[Any],cellSpaces:[CGFloat]){
        super.init()
        self.tableView = tableView
        self.cellProvider = tableView
        universalDelegateHandler = MultiDelegatesProxy.newProxy(withMainDelegate: self, other: delegateArray)
        self.tableView?.delegate = universalDelegateHandler as? UITableViewDelegate
        self.tableView?.dataSource = self
        self.spaceBetweenCells = cellSpaces
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return itemModels.count
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (self.cellsHeight.count == self.itemModels.count) {
            return self.cellsHeight[indexPath.section]
        }
        else {
            return 100
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return spaceBetweenCells[section]
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.section]
    }
    
    public override func reuseCell<CellType>(for index: Flexy.Index, from cellProvider: CellProvider) -> CellType where CellType : Flexy.View {
        let model = itemModels[index.section]
        guard let viewBinder = self.viewBinders[model.itemId] else {
            fatalError("Can't find ViewBinder for key '\(model.itemId)'")
        }
        
        guard let cell = cellProvider.reuseCell(for: index, with: viewBinder.cellIdentifier) as? CellType else {
            fatalError("Can't reuse cell with passed CellType: \(CellType.self)")
        }
        
        do {
            return try viewBinder.tryToBind(model: model, to: cell)
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    public func loadCells() -> [Flexy.View]{
        for i in 0..<itemModels.count{
            let cell = reuseCell(for: Flexy.Index(section: i, item: 0), from: tableView!) as! UITableViewCell
            cells.append(cell)
        }
        return cells
    }
    
    public func calculateCellHeight(collectionCellController:CollectionCellController){
        let columns:Int = collectionCellController.cellConfig.columns
        let scrollable:Bool = collectionCellController.cellConfig.scrollable
        let numberOfItems:Int = collectionCellController.itemModels.count
        let itemSpacing:ItemSpacing = collectionCellController.cellConfig.itemSpacing
        if (collectionCellController.width  <= (self.tableView?.frame.width)!/CGFloat(columns) && columns > 1){
            if (numberOfItems % columns > 0 ) {
                if (scrollable){
                    cellsHeight.append((collectionCellController.height + itemSpacing.minInteritemSpacing) * CGFloat(numberOfItems)/CGFloat(columns) / (CGFloat(numberOfItems/columns)))
                }
                else {
                    cellsHeight.append((collectionCellController.height + itemSpacing.minInteritemSpacing) * (CGFloat(numberOfItems)/CGFloat(columns) + 1))
                }
            }
            else {
                if (scrollable){
                    cellsHeight.append((collectionCellController.height + itemSpacing.minInteritemSpacing) * CGFloat(numberOfItems)/CGFloat(columns) / (CGFloat(numberOfItems/columns)))
                }
                else {
                    cellsHeight.append((collectionCellController.height + itemSpacing.minInteritemSpacing) * CGFloat(numberOfItems/columns))
                }
            }
        }
        else {
            if(scrollable){
                cellsHeight.append(collectionCellController.height + itemSpacing.minInteritemSpacing)
            }
            else {
                cellsHeight.append((collectionCellController.height + itemSpacing.minInteritemSpacing) * CGFloat(numberOfItems))
            }
        }
        
        tableView?.reloadData()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
