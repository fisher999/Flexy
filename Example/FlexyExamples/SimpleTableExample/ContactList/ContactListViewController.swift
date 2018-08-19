//
//  ViewController.swift
//  FlexyExamples
//
//  Created by Anisov Aleksey on 3/5/18.
//  Copyright © 2018 Flexy. All rights reserved.
//

import UIKit
import Flexy




class ContactListViewController: UIViewController{
    
    @IBOutlet private var tableView: UITableView!
    
    public var tableController:SimpleTableController!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableController = SimpleTableController(tableView: tableView, withDataSource: [])
        tableController.register(binder: ContactViewBinder({[weak self] item in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let contactItemViewController = storyboard.instantiateViewController(withIdentifier: "ContactInfoViewController") as? ContactItemViewController else { return }
            contactItemViewController.loadViewIfNeeded()
            contactItemViewController.avatarImage = item.photo
            contactItemViewController.name = item.name
            
            self?.show(contactItemViewController, sender: nil)
        }))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var itemModels:[ItemModel] = [
            ContactItemModel(photo: UIImage(named: "avatar3")!, name: "Benjamin"),
             ContactItemModel(photo: UIImage(named: "avatar1")!, name: "Sofia"),
            ContactItemModel(photo: UIImage(named: "avatar2")!, name: "Barry"),
             ContactItemModel(photo: UIImage(named: "avatar1")!, name: "Elizabeth"),
             ContactItemModel(photo: UIImage(named: "avatar1")!, name: "Chloe"),
             ContactItemModel(photo: UIImage(named: "avatar3")!, name: "Brian"),
            ContactItemModel(photo: UIImage(named: "avatar2")!, name: "Corwin"),
             ContactItemModel(photo: UIImage(named: "avatar3")!, name: "Christopher"),
             ContactItemModel(photo: UIImage(named: "avatar1")!, name: "Marie")
        ]
        tableController.itemModels = itemModels
    }


   
}


























