//
//  ViewController.swift
//  Moproto
//
//  Created by Joe Blau on 8/31/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate let noProjectLabel = UILabel()

    init() {
        super.init(nibName: nil, bundle: nil)
        noProjectLabel.translatesAutoresizingMaskIntoConstraints = false
        noProjectLabel.text = "Double tap screen to begin"
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
        view.addSubview(noProjectLabel)
        noProjectLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        noProjectLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

}

