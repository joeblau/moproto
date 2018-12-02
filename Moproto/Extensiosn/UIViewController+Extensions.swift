//
//  UIViewController+Extensions.swift
//  Moproto
//
//  Created by Joe Blau on 12/1/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

extension UIViewController {
    func attachDropDelegates(delegate: UIDropInteractionDelegate) {
        for subview in view.subviews {
            let dropInteraction = UIDropInteraction(delegate: delegate)
            switch subview {
            case is UIControl:
                subview.liveEditView.addInteraction(dropInteraction)
            default: break
            }
        }
    }
}
