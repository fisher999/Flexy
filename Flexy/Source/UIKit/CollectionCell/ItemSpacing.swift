//
//  ItemSpacing.swift
//  Flexy
//
//  Created by Виктор on 16/08/2018.
//  Copyright © 2018 Aleksey Anisov. All rights reserved.
//

import Foundation
import UIKit

public class ItemSpacing {
    var minInteritemSpacing:CGFloat!
    var minLineSpacing:CGFloat!
    init(minInteritemSpacing:CGFloat,minLineSpacing:CGFloat) {
        self.minInteritemSpacing = minInteritemSpacing
        self.minLineSpacing = minLineSpacing
    }
}
