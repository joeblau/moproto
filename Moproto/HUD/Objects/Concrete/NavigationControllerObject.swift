//
//  NavigationControllerObject.swift
//  Moproto
//
//  Created by Joe Blau on 9/1/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

struct NavigationControllerObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UINavigationController")
    var title: String = "navigation_controller_title".localize
    var description: String = "navigation_controller_description".localize
    var category: ObjectCategory = .controller
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UINavigationController.self))
}
