//
//  ViewObject.swift
//  Moproto
//
//  Created by Joe Blau on 9/1/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

class ViewObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UIView")
    var title: String = "view_title".localize
    var description: String = "view_description".localize
    var category: ObjectCategory = .view
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UIView.self))
}
