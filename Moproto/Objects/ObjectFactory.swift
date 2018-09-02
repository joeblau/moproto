//
//  ObjectFactory.swift
//  Moproto
//
//  Created by Joe Blau on 8/31/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import Foundation

class ObjectFactory {
    static func build() -> [Object] {
        return [ViewControllerObject(),
                NavigationControllerObject(),
                TableViewControllerObject(),
                ButtonObject(),
                ViewObject(),
                ContainerViewObject()
        ]
    }
}
