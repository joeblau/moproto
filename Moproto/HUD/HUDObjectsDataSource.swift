//
//  HUDObjectsDataSource.swift
//  Moproto
//
//  Created by Joe Blau on 8/31/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

class HUDObjectsDataSource: NSObject, UITableViewDataSource {

    let objects = ObjectFactory.build()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: String(describing: UITableViewCell.self))
        cell.textLabel?.text = objects[indexPath.row].title
        cell.detailTextLabel?.text = objects[indexPath.row].description
        cell.imageView?.image = objects[indexPath.row].image

        return cell
    }
}
