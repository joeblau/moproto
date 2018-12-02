//
//  BlankViewController.swift
//  Moproto
//
//  Created by Joe Blau on 11/19/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

class WhiteViewController: UIViewController {

    init(dropDelegate: UIDropInteractionDelegate) {
        super.init(nibName: nil, bundle: nil)
        let dropInteraction = UIDropInteraction(delegate: dropDelegate)
        view.addInteraction(dropInteraction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return [.bottom, .top]
    }
    
    override func loadView() {
        super.loadView()
        view = MView()
    }
}
