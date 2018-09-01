//
//  ViewControllerObject.swift
//  Moproto
//
//  Created by Joe Blau on 9/1/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

struct ViewControllerObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UIViewController")
    var title: String = "view_controller_title".localize
    var description: String = "view_controller_description".localize
    var type: ObjectType = .viewController
}

