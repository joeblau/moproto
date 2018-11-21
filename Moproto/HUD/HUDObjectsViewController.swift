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
    func play()
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

        navigationItem.leftBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))]
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(play))]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let sc =  UISegmentedControl(items: ["Objects"])
        sc.selectedSegmentIndex = 0
        navigationItem.titleView = sc

        view.backgroundColor = UIColor(named: "hud-background")
    }

    @objc func cancel() {
        actionable?.dismiss()
    }
    
    @objc func play() {
        actionable?.play()
    }
    
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return .bottom
    }
    
}
