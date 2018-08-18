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


class ContactCollectionController: UIViewController{
    
    @IBOutlet weak var tableView:UITableView!
    
    var tableCollectionController:TableCollectionController<CollectionViewBinder,ContactTableCell>!
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellsConfig = [CellConfiguration(columns: 1, rows: 3, scrollable: false, numberOfItems: 1),
                            CellConfiguration(columns: 2, rows: 4, scrollable: true, numberOfItems: 4),
                           CellConfiguration(columns: 2, rows: 3, scrollable: true, numberOfItems: 4),
                           CellConfiguration(columns: 1, rows: 3, scrollable: false, numberOfItems: 2),
                           ]
        
        tableCollectionController = TableCollectionController(tableView: tableView, identifier: "TableCell", cellsConfiguration: cellsConfig, with: [], itemModels: AppDelegate().dataSource.getData() as! [ItemModel])
        tableCollectionController.setSpacing(minInteritemSpace: 10, minLineSpace: 5)
        let collectionBinder = CollectionViewBinder({[weak self] item in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let contactItemViewController = storyboard.instantiateViewController(withIdentifier: "ContactInfoViewController") as? ContactItemViewController else { return }
            contactItemViewController.loadViewIfNeeded()
            contactItemViewController.avatarImage = item.photo
            contactItemViewController.name = item.name
            
            self?.show(contactItemViewController, sender: nil)
        })
        tableCollectionController.addBinder(binder: HeaderCellBinder())
        for _ in 0..<10 {
            tableCollectionController.addBinder(binder: collectionBinder)
        }
        tableCollectionController.register()
        
        
        
        
    }
    
    
    
    
}


