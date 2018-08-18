//
//  CollectionViewBinder.swift
//  Flexy
//
//  Created by Виктор on 15/08/2018.
//  Copyright © 2018 Aleksey Anisov. All rights reserved.
//

import Foundation
import UIKit

public protocol CollectionBinder {
    func initCollectionCellController(numberOfColumns:Int,itemSpacing:ItemSpacing) -> CollectionCellController
}
