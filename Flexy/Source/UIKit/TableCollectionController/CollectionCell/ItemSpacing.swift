//
//  ItemSpacing.swift
//  Flexy
//
//  Created by Виктор on 16/08/2018.
//  Copyright © 2018 Aleksey Anisov. All rights reserved.
//

import Foundation
import UIKit

public struct ItemSpacing {
    public var minInteritemSpacing:CGFloat!
    public var minLineSpacing:CGFloat!
    public init(minInteritemSpacing:CGFloat,minLineSpacing:CGFloat) {
        self.minInteritemSpacing = minInteritemSpacing
        self.minLineSpacing = minLineSpacing
    }
}
