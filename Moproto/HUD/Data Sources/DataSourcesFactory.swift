//
//  DataSourcesFactory.swift
//  Moproto
//
//  Created by Joe Blau on 11/25/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

class DataSourcesFactory {
    static func build() -> [HUDItem] {
        return [UITableViewDesignersDataSource()]
    }
}
