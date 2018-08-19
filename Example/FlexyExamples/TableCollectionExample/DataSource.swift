//
//  DataSource.swift
//  FlexyExamples
//
//  Created by Виктор on 11/08/2018.
//  Copyright © 2018 Flexy. All rights reserved.
//

import Foundation
import UIKit
import Flexy


class DataSource:UIViewController {
    
    let itemModelsForTableController = [TableCellsItemModel(cellConfig: CellConfiguration(columns: 1, itemSpacing: ItemSpacing(minInteritemSpacing: 0, minLineSpacing: 0), cellSize: CGSize(width: UIScreen.main.bounds.width , height: 70), scrollable: false)),TableCellsItemModel(cellConfig: CellConfiguration(columns: 1, itemSpacing: ItemSpacing(minInteritemSpacing: 0, minLineSpacing: 0), cellSize: CGSize(width: 180, height: 90), scrollable: true)),
                                        TableCellsItemModel(cellConfig: CellConfiguration(columns: 1, itemSpacing: ItemSpacing(minInteritemSpacing: 0, minLineSpacing: 0), cellSize: CGSize(width: UIScreen.main.bounds.width, height: 70), scrollable: false)),
                                        TableCellsItemModel(cellConfig: CellConfiguration(columns: 2, itemSpacing: ItemSpacing(minInteritemSpacing: 0, minLineSpacing: 0), cellSize: CGSize(width: 180, height: 90), scrollable: false)),
                                        TableCellsItemModel(cellConfig: CellConfiguration(columns: 1, itemSpacing: ItemSpacing(minInteritemSpacing: 0, minLineSpacing: 0), cellSize: CGSize(width: UIScreen.main.bounds.width, height: 70), scrollable: true)),
                                        TableCellsItemModel(cellConfig: CellConfiguration(columns: 1, itemSpacing: ItemSpacing(minInteritemSpacing: 0, minLineSpacing: 0), cellSize: CGSize(width: 180, height: 90), scrollable: false))]
    
    let itemModelsForSections:[[Any]] = [[HeaderItemModel(title: "Coupes")],
                              [CarItemModel(photo: UIImage(named: "coupe1")!, price: "3000$"),
                               CarItemModel(photo: UIImage(named: "coupe2")!, price: "3500$"),
                               CarItemModel(photo: UIImage(named: "coupe3")!, price: "4400$")],
                              [HeaderItemModel(title: "Sedans")],
                              [CarItemModel(photo: UIImage(named: "sedan1")!, price: "7000$"),
                               CarItemModel(photo: UIImage(named: "sedan2")!, price: "4000$"),
                               CarItemModel(photo: UIImage(named: "sedan3")!, price: "9600$"),
                               CarItemModel(photo: UIImage(named: "sedan4")!, price: "10000$")],
                              [HeaderItemModel(title: "Minivans")],
                              [CarItemModel(photo: UIImage(named: "van1")!, price: "12000$"),
                               CarItemModel(photo: UIImage(named: "van2")!, price: "15000$"),
                               CarItemModel(photo: UIImage(named: "van3")!, price: "14300$")]
    ]
    
}
