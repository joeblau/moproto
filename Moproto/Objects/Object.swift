//
//  Object.swift
//  Moproto
//
//  Created by Joe Blau on 8/31/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

enum ObjectType {
    case viewController
    case widget
    case gesture
    case view
    case control
}

protocol Object {
    var image: UIImage { get }
    var title: String { get }
    var description: String { get }
    var type: ObjectType { get }
}
