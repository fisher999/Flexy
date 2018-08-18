//
//  TableCollectionController.swift
//  Flexy
//
//  Created by Виктор on 03/08/2018.
//  Copyright © 2018 Aleksey Anisov. All rights reserved.
//

import Foundation
import UIKit


public class TableCollectionController<Binder:ViewBinder,Cell:CollectionBinder>:AbstractController, UITableViewDelegate, UITableViewDataSource {
    
    
    private weak var tableView: UITableView?
    private var itemSpacing:ItemSpacing!
    private var cellsConfiguration:[CellConfiguration]!
    private var itemSizes = [ItemSize]()
    private var cellsHeight = [CGFloat]()
    private var identifier:String?
    private var numberOfSections:Int = 0
    private var delegateArray:[Any]!
    private var cells = [Cell]()
    private var binders:[Binder] = [Binder]()
    
    
    
    public override var itemModels: [ItemModel] {
        didSet {
            var count = itemModels.count
            for cell in cellsConfiguration {
                if(count - cell.numberOfItems >= 0) {
                    numberOfSections += 1
                    count = count - cell.numberOfItems
                }
                    
            }
            if (count > 0 ) {
                numberOfSections += 1
            }
            
        }
    }
    
   
    public init(tableView:UITableView,identifier:String,cellsConfiguration:[CellConfiguration],with delegateArray:[Any],itemModels:[ItemModel]){
        super.init()
        self.tableView = tableView
        self.cellProvider = tableView
        self.cellsConfiguration = cellsConfiguration
        self.identifier = identifier
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.delegateArray = delegateArray
        self.itemModels = itemModels
    }
    
    public func setSpacing(minInteritemSpace:CGFloat,minLineSpace:CGFloat){
        self.itemSpacing = ItemSpacing(minInteritemSpacing: minInteritemSpace, minLineSpacing: minLineSpace)
    }
    
    public func addBinder<VB>(binder: VB) where VB : ViewBinder {
        self.binders.append(binder as! Binder)
    }
    
    public func register() {
        loadCells()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfSections
    }
    
    func loadCells(){
        var currentItem = 0
        for index in 0 ..< self.numberOfSections {
            let cell = tableView?.dequeueReusableCell(withIdentifier: self.identifier!, for: IndexPath(item: index, section: 0)) as? Cell
            let collectionCellController = cell?.initCollectionCellController(numberOfColumns: self.cellsConfiguration[index].columns, itemSpacing: self.itemSpacing)
            let layout = collectionCellController?.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
            layout.minimumInteritemSpacing = self.itemSpacing.minInteritemSpacing
            layout.minimumLineSpacing = self.itemSpacing.minLineSpacing
            collectionCellController?.collectionView?.collectionViewLayout = layout
            collectionCellController?.collectionView?.isScrollEnabled = self.cellsConfiguration[index].scrollable
            collectionCellController?.register(binder: self.binders[index])
            print("Binders:\(String(describing: collectionCellController?.viewBinders))")
            if (index != numberOfSections - 1) {
                collectionCellController?.itemModels = Array(self.itemModels[currentItem..<currentItem + self.cellsConfiguration[index].numberOfItems])
            }
            else {
                collectionCellController?.itemModels = Array(self.itemModels[currentItem..<self.itemModels.count])
            }
            currentItem += self.cellsConfiguration[index].numberOfItems
            let collectionCell = collectionCellController?.collectionView((collectionCellController?.collectionView)!, cellForItemAt: IndexPath(item:0, section: 0))
            itemSizes.append(ItemSize(height: (collectionCell?.frame.height)!, width: (collectionCell?.frame.width)!))
            self.cells.append(cell!)
            self.cellsHeight.append(calculateCellHeight(index: index))
        }
        tableView?.reloadData()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.row] as! UITableViewCell
    }
    
    func calculateCellHeight(index:Int)->CGFloat{
        if (itemSizes[index].width  <= (self.tableView?.frame.width)!/CGFloat(self.cellsConfiguration[index].columns) && self.cellsConfiguration[index].columns > 1){
            if (self.cellsConfiguration[index].numberOfItems % self.cellsConfiguration[index].columns > 0 ) {
                if (self.cellsConfiguration[index].scrollable){
                return ((itemSizes[index].height + itemSpacing.minInteritemSpacing) * CGFloat(self.cellsConfiguration[index].numberOfItems)/CGFloat(self.cellsConfiguration[index].columns) + itemSizes[index].height + itemSpacing.minInteritemSpacing) / CGFloat(self.cellsConfiguration[index].numberOfItems / self.cellsConfiguration[index].columns)
                }
                else {
                    return ((itemSizes[index].height + itemSpacing.minInteritemSpacing) * CGFloat(self.cellsConfiguration[index].numberOfItems)/CGFloat(self.cellsConfiguration[index].columns) + itemSizes[index].height + itemSpacing.minInteritemSpacing)
                }
            }
            else {
                if (self.cellsConfiguration[index].scrollable){
                    return (itemSizes[index].height + itemSpacing.minInteritemSpacing) * CGFloat(self.cellsConfiguration[index].numberOfItems)/(CGFloat(self.cellsConfiguration[index].columns) * CGFloat(self.cellsConfiguration[index].numberOfItems / self.cellsConfiguration[index].columns))
                }
                else {
                    return (itemSizes[index].height + itemSpacing.minInteritemSpacing) * CGFloat(self.cellsConfiguration[index].numberOfItems)/CGFloat(self.cellsConfiguration[index].columns)
                }
            }
        }
        else {
            return (itemSizes[index].height + itemSpacing.minInteritemSpacing) * CGFloat(self.cellsConfiguration[index].numberOfItems)
        }
    }
    
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (self.cellsHeight.count == self.numberOfSections) {
            return self.cellsHeight[indexPath.row]
        }
        else {
            return 250
        }
    }
    
    
    
    
    
    
    
    
}
