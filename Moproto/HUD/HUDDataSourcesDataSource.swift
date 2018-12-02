//
//  HUDDataSourcesDataSource.swift
//  Moproto
//
//  Created by Joe Blau on 11/25/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

class HUDDataSourcesDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    let dataSources = DataSourcesFactory.build()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: String(describing: UITableViewCell.self))
        cell.textLabel?.text = dataSources[indexPath.row].title
        cell.textLabel?.textColor = UIColor.lightText
        cell.detailTextLabel?.text = dataSources[indexPath.row].description
        cell.detailTextLabel?.textColor = UIColor.lightText
        cell.backgroundColor = UIColor(named: "cell-background")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.contentView.backgroundColor = UIColor(named: "cell-highlighted")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.contentView.backgroundColor = UIColor(named: "cell-selected")
    }
}
