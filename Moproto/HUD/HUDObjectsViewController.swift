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

    fileprivate let dataSource = HUDObjectsDataSource()
    var actionable: HUDObjectsActionable?

    init() {
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        tableView.delegate = self
        tableView.dataSource = dataSource
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Objects"
        view.backgroundColor = UIColor.red.withAlphaComponent(0.4)
    }


}

extension HUDObjectsViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        actionable?.dismiss()
    }
}
