//
//  ContactCollectionController.swift
//  FlexyExamples
//
//  Created by Виктор on 17/08/2018.
//  Copyright © 2018 Flexy. All rights reserved.
//

import Foundation
import Flexy
import UIKit


class CarCollectionController: UIViewController{
    
    @IBOutlet weak var tableView:UITableView!
    
    lazy var tableCollectionController:TableCollectionController = TableCollectionController(tableView: tableView, with: [], cellSpaces: [0,0,30,0,30,0])
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.tableCollectionController.itemModels = DataSource().itemModelsForTableController
        tableCollectionController.register(binder: TableCellViewVinder())
        let cells = tableCollectionController.loadCells() as![CarTableCell]
        let collectionItemModels = DataSource().itemModelsForSections
        for i in 0..<tableCollectionController.itemModels.count{
            switch(i){
            case 0,2,4:
                cells[i].initCollectionCellController()
                cells[i].collectionCellController.itemModels = collectionItemModels[i] as! [ItemModel]
                cells[i].collectionCellController.register(binder: HeaderCellBinder())
                break
            default:
                cells[i].initCollectionCellController()
                cells[i].collectionCellController.itemModels = collectionItemModels[i] as! [ItemModel]
                cells[i].collectionCellController.register(binder: CollectionViewBinder({[weak self] item in
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    guard let carItemViewController = storyboard.instantiateViewController(withIdentifier: "CarItemController") as? CarItemViewController else { return }
                    carItemViewController.loadViewIfNeeded()
                    carItemViewController.avatarImage = item.photo
                    carItemViewController.price = item.price
                    
                    self?.show(carItemViewController, sender: nil)
                    
                }))
            }
            self.tableCollectionController.calculateCellHeight(collectionCellController: cells[i].collectionCellController)
        }
    }
    
    
    
}


