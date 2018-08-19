//
//  TableSize.swift
//  Flexy
//
//  Created by Виктор on 16/08/2018.
//  Copyright © 2018 Aleksey Anisov. All rights reserved.
//

import Foundation
import UIKit


public struct CellConfiguration {
    var columns:Int!
    var itemSpacing:ItemSpacing!
    var cellSize: CGSize!
    var scrollable:Bool!
    public init(columns:Int,itemSpacing:ItemSpacing,cellSize:CGSize,scrollable:Bool){
        self.columns = columns
        self.itemSpacing = itemSpacing
        self.cellSize = cellSize
        self.scrollable = scrollable
    }
}
