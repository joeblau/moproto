//
//  ObjectEditable.swift
//  Moproto
//
//  Created by Joe Blau on 11/21/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

enum EditableRadius: CGFloat {
    case zero = 0.0
    case small = 2.0
    case medium = 8.0
    case large = 16.0
}

enum EditableDimensions {
    case none
    case horizontal
    case vertical
    case horizontalAndVertical
}

struct Editable {
    var radius: EditableRadius
    var dimensions: EditableDimensions
}
