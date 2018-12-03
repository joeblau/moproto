//
//  UIControl+Extensions.swift
//  Moproto
//
//  Created by Joe Blau on 12/2/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

extension UIControl {
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let relativeFrame = self.bounds
        let hitTestEdgeInsets = UIEdgeInsets(top: -Constants.EDITOR_BUFFER,
                                             left: -Constants.EDITOR_BUFFER,
                                             bottom: -Constants.EDITOR_BUFFER,
                                             right: -Constants.EDITOR_BUFFER)
        let hitFrame = relativeFrame.inset(by: hitTestEdgeInsets)
        return hitFrame.contains(point)
    }
}
