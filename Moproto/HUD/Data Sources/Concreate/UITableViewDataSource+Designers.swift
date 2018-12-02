//
//  UITableViewDataSource+Designers.swift
//  Moproto
//
//  Created by Joe Blau on 11/25/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

class UITableViewDesignersDataSource: NSObject, UITableViewDataSource, UITableViewDelegate, HUDItem {
    var image: UIImage = UIImage()
    var title: String = "Designers"
    var category: ObjectCategory = .dataSource
    var type: NSItemProviderWriting = MoprotoDataSourceType(name: String(describing: UITableViewDataSource.self))
    
    private let designers = ["Linda Dong", "Patrick Wong", "Sean Chin", "James Bramford"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return designers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        cell.textLabel?.text = designers[indexPath.row]
        return cell
    }
}
