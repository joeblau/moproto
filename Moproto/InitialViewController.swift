//
//  InitialViewController.swift
//  Moproto
//
//  Created by Joe Blau on 8/31/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit


class InitialViewController: UIViewController {

    fileprivate let noProjectLabel = UILabel()

    init() {
        super.init(nibName: nil, bundle: nil)
        noProjectLabel.translatesAutoresizingMaskIntoConstraints = false
        noProjectLabel.numberOfLines = 0
        noProjectLabel.textAlignment = .center
        noProjectLabel.alpha = 0
        noProjectLabel.textColor = UIColor.darkText
        noProjectLabel.text = "Swipe up from bottom to begin"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        configureViews()
        animateViews()
    }

    fileprivate func configureViews() {
        view.addSubview(noProjectLabel)
        noProjectLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        noProjectLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        noProjectLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        noProjectLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
    }
    
    fileprivate func animateViews() {
        UIView.animate(withDuration: 0.3, delay: 1.4, options: .curveEaseIn, animations: {
            self.noProjectLabel.alpha = 1.0
        })
    }
    
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return .bottom
    }

}
