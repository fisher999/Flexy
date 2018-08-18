//
//  SimpleTableController.swift
//  Flexy
//
//  Created by Anisov Aleksey on 3/5/18.
//  Copyright © 2018 Aleksey Anisov. All rights reserved.
//

import UIKit


public class SimpleTableController: AbstractController, UITableViewDelegate, UITableViewDataSource {
    
    private weak var tableView: UITableView?
    public var universalDelegateHandler: MultiDelegatesProxy?
    public var universalDataSourceHandler: MultiDelegatesProxy?
    public override var itemModels: [ItemModel] {
        didSet {
            
            tableView?.reloadData()
        }
    }
    
    public init(tableView: UITableView,withDataSource dataSourceArray:[Any]) {
        super.init()
        self.tableView = tableView
        self.cellProvider = tableView
        universalDataSourceHandler = MultiDelegatesProxy.newProxy(withMainDelegate: self, other: dataSourceArray)
        self.tableView?.delegate = self
        self.tableView?.dataSource = universalDataSourceHandler as? UITableViewDataSource

    }
    
    public init (tableView: UITableView, withTableViewDelegate delegateArray:[Any]) {
        super.init()
        self.tableView = tableView
        self.cellProvider = tableView
        universalDelegateHandler = MultiDelegatesProxy.newProxy(withMainDelegate: self, other: delegateArray)
        self.tableView?.delegate = universalDelegateHandler as? UITableViewDelegate
        self.tableView?.dataSource = self
    }
    
    public init (tableView: UITableView, withTableViewDelegate delegateArray:[Any], dataSourceArray:[Any]) {
        super.init()
        self.tableView = tableView
        self.cellProvider = tableView
        universalDelegateHandler = MultiDelegatesProxy.newProxy(withMainDelegate: self, other: delegateArray)
        universalDataSourceHandler = MultiDelegatesProxy.newProxy(withMainDelegate: self, other: dataSourceArray)
        self.tableView?.delegate = universalDelegateHandler as? UITableViewDelegate
        self.tableView?.dataSource = universalDataSourceHandler as? UITableViewDataSource
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemModels.count
    }
    
    public func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return reuseCell(for: Flexy.Index(section: indexPath.section, item: indexPath.row), from: tableView) 
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didClickOnItem(on: Flexy.Index(section: indexPath.section, item: indexPath.row))
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}
