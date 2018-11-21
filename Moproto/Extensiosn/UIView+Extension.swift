//
//  UIView+Extension.swift
//  Moproto
//
//  Created by Joe Blau on 11/21/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

extension UIView {
    var editable: Editable {
        switch self {
        case is UISegmentedControl,
             is UIStepper:
            return Editable(radius: .medium, dimensions: .horizontal)
        case is UISlider:
            return Editable(radius: .large, dimensions: .horizontal)
        case is UISwitch,
             is UIActivityIndicatorView:
            return Editable(radius: .large, dimensions: .none)
        case is UIProgressView:
            return Editable(radius: .zero, dimensions: .horizontal)
        default:
            return Editable(radius: .small, dimensions: .horizontalAndVertical)
        }
    }
}
