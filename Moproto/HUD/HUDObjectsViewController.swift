//
//  HUDObjectsViewController.swift
//  Moproto
//
//  Created by Joe Blau on 8/31/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

protocol HUDObjectsActionable {
    func play()
}

class HUDObjectsViewController: UITableViewController {
    
    let hudObjectsDataSource = HUDObjectsDataSource()
    let hudDataSourcesDataSource = HUDDataSourcesDataSource()
    let segmentedControl =  UISegmentedControl(items: ["Objects", "Data"])
    var actionable: HUDObjectsActionable?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        tableView.dragInteractionEnabled = true
        tableView.delegate = self

        navigationItem.leftBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))]
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(play))]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.addTarget(self, action: #selector(selectSegment(segmented:)), for: .valueChanged)
        navigationItem.titleView = segmentedControl
        segmentedControl.selectedSegmentIndex = 0
        view.backgroundColor = UIColor(named: "hud-background")
        updateDataSources()
    }

    @objc func cancel() {
        self.view.window?.isHidden = true
    }
    
    @objc func play() {
        actionable?.play()
    }
    
    @objc func selectSegment(segmented: UISegmentedControl) {
        updateDataSources()
    }
    
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return .bottom
    }
    
    private func updateDataSources() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            tableView.dataSource = hudObjectsDataSource
            tableView.dragDelegate = hudObjectsDataSource
        case 1:
            tableView.dataSource = hudDataSourcesDataSource
            tableView.dragDelegate = hudDataSourcesDataSource
            
        default: break
        }
        tableView.reloadData()
    }
}
