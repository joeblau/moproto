//
//  InitialViewController.swift
//  Moproto
//
//  Created by Joe Blau on 8/31/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    fileprivate let initialControl = UIInitialControl()
    
    init(dropDelegate: UIDropInteractionDelegate) {
        super.init(nibName: nil, bundle: nil)
        let dropInteraction = UIDropInteraction(delegate: dropDelegate)
        initialControl.liveEditView.addInteraction(dropInteraction)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        configureViews()
    }

    fileprivate func configureViews() {
        view.addSubview(initialControl)
        initialControl.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: view.center.x).isActive = true
        initialControl.centerYAnchor.constraint(equalTo: view.topAnchor, constant: view.center.y).isActive = true
    }
    
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return [.bottom, .top]
    }
}
