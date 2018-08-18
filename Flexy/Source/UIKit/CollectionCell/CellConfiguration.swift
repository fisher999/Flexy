//
//  TableSize.swift
//  Flexy
//
//  Created by Виктор on 16/08/2018.
//  Copyright © 2018 Aleksey Anisov. All rights reserved.
//

import Foundation


public class CellConfiguration {
    public var columns:Int!
    public var rows:Int!
    public var scrollable:Bool!
    public var numberOfItems:Int!
    public init(columns:Int,rows:Int,scrollable:Bool,numberOfItems:Int){
        self.columns = columns
        self.rows = rows
        self.scrollable = scrollable
        self.numberOfItems = numberOfItems
    }
}
