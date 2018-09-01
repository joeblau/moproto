//
//  HUDObjectsDataSource.swift
//  Moproto
//
//  Created by Joe Blau on 8/31/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

class HUDObjectsDataSource: NSObject, UITableViewDataSource {

    fileprivate let objects = ["View Controller",
                               "Navigation Controller",
                               "Table View Controller",
                               "Collection View Controller",
                               "Tab Bar Controller",
                               "Split View Controller"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        cell.textLabel?.text = objects[indexPath.row]
        return cell
    }
}
