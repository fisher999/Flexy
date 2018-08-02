//
//  ViewController.swift
//  FlexyExamples
//
//  Created by Anisov Aleksey on 3/5/18.
//  Copyright © 2018 Flexy. All rights reserved.
//

import UIKit
import Flexy


public class ConstRowHeightDelegate:UIViewController,UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

class ManualRowHeightDelegate:UIViewController,UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell") as! ContactTableViewCell
        let size:CGSize = cell.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        return size.height+1
    }
}

class ContactListViewController: UIViewController{
    
    @IBOutlet private var tableView: UITableView!
    
    private lazy var delegateHandler = UniversalDelegateHandler(for: UITableViewDelegate.self )
    private lazy var tableController = SimpleTableController(tableView: tableView)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableController.register(binder: ContactViewBinder({[weak self] item in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let contactItemViewController = storyboard.instantiateViewController(withIdentifier: "ContactInfoViewController") as? ContactItemViewController else { return }
            contactItemViewController.loadViewIfNeeded()
            contactItemViewController.avatarImage = item.photo
            contactItemViewController.name = item.name
            
            self?.show(contactItemViewController, sender: nil)
        }))
        let delegate = ConstRowHeightDelegate()
        tableController.universalDelegateHandler = delegateHandler
        tableController.addTableDelegate(delegate)
        
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableController.itemModels = [
            ContactItemModel(photo: UIImage(named: "avatar1")!, name: "Marie"),
            ContactItemModel(photo: UIImage(named: "avatar3")!, name: "Benjamin"),
            ContactItemModel(photo: UIImage(named: "avatar1")!, name: "Sofia"),
            ContactItemModel(photo: UIImage(named: "avatar2")!, name: "Barry"),
            ContactItemModel(photo: UIImage(named: "avatar1")!, name: "Elizabeth"),
            ContactItemModel(photo: UIImage(named: "avatar1")!, name: "Chloe"),
            ContactItemModel(photo: UIImage(named: "avatar3")!, name: "Brian"),
            ContactItemModel(photo: UIImage(named: "avatar2")!, name: "Corwin"),
            ContactItemModel(photo: UIImage(named: "avatar3")!, name: "Christopher"),
        ]
    }

   
}
























