//
//  ContainerViewObject.swift
//  Moproto
//
//  Created by Joe Blau on 9/1/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

struct ContainerViewObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UIContainerView")
    var title: String = "container_view_title".localize
    var description: String = "container_view_description".localize
    var type: ObjectType = .view
}
