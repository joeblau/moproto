//
//  Object.swift
//  Moproto
//
//  Created by Joe Blau on 8/31/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit
import MobileCoreServices

enum ObjectCategory {
    case viewController
    case controller
    case gesture
    case view
    case control
    case dataSource
}

protocol HUDItem {
    var image: UIImage { get }
    var title: String { get }
    var description: String { get }
    var category: ObjectCategory { get }
    var type: NSItemProviderWriting { get }
}

extension HUDItem {
    var dragItem: UIDragItem {
        let itemProvider = NSItemProvider(object: self.type)
        return UIDragItem(itemProvider: itemProvider)
    }
}
