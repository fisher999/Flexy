//
//  CollectionView+CellProvider.swift
//  Flexy
//
//  Created by Виктор on 04/08/2018.
//  Copyright © 2018 Aleksey Anisov. All rights reserved.
//

import Foundation


import UIKit

extension UICollectionView: CellProvider {
    public func reuseCell(for index: Flexy.Index, with type: String) -> Flexy.View {
        return dequeueReusableCell(withReuseIdentifier: type, for: IndexPath(row: index.item, section: index.section))
    }
    
    public func register(type: AnyClass, forId id: String) {
        register(type, forCellWithReuseIdentifier: id)
    }
}
