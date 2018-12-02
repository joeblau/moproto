//
//  DeferredTableViewController.swift
//  Moproto
//
//  Created by Joe Blau on 11/25/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

class DeferredTableViewController: UITableViewController {

    init(dataSource: UITableViewDataSource) {
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        tableView.dataSource = dataSource
        tableView.isScrollEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return .bottom
    }
}
