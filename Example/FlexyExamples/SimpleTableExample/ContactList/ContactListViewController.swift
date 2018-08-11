//
//  ViewController.swift
//  FlexyExamples
//
//  Created by Anisov Aleksey on 3/5/18.
//  Copyright © 2018 Flexy. All rights reserved.
//

import UIKit
import Flexy




class ContactListViewController: UIViewController,UITableViewDataSource{
    var dataSource:DataSource!
    
    @IBOutlet private var tableView: UITableView!
    
    public var tableController:SimpleTableController!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableController = SimpleTableController(tableView: tableView, withDataSource: [self])
        tableController.register(binder: ContactViewBinder({[weak self] item in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let contactItemViewController = storyboard.instantiateViewController(withIdentifier: "ContactInfoViewController") as? ContactItemViewController else { return }
            contactItemViewController.loadViewIfNeeded()
            contactItemViewController.avatarImage = item.photo
            contactItemViewController.name = item.name
            
            self?.show(contactItemViewController, sender: nil)
        }))
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let appDelegate = AppDelegate()
        return appDelegate.dataSource.itemModels.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableController.reuseCell(for: Flexy.Index(section: indexPath.section, item: indexPath.row), from: tableView)
    }
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            tableController.itemModels.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let appDelegate = AppDelegate()
        self.dataSource = appDelegate.dataSource
        tableController.itemModels = self.dataSource.getData()
    }


   
}


























