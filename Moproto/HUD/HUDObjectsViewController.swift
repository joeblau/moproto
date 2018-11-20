//
//  HUDObjectsViewController.swift
//  Moproto
//
//  Created by Joe Blau on 8/31/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

protocol HUDObjectsActionable {
    func dismiss()
}

class HUDObjectsViewController: UITableViewController {

    let objects = ObjectFactory.build()
    var actionable: HUDObjectsActionable?

    init() {
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        tableView.dragInteractionEnabled = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.dragDelegate = self

        navigationItem.leftBarButtonItems = [UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(cancel))]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Objects"
        view.backgroundColor = UIColor(white: 1.0, alpha: 0.94)
    }

    @objc func cancel() {
        actionable?.dismiss()
    }
    
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return .bottom
    }
    
}
