//
//  TableViewControllerObject.swift
//  Moproto
//
//  Created by Joe Blau on 9/1/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

struct TableViewControllerObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UITableViewController")
    var title: String = "table_view_controller_title".localize
    var description: String = "table_view_controller_description".localize
    var type: ObjectType = .viewController
}
