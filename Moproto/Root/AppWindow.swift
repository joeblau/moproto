//
//  AppWindow.swift
//  Moproto
//
//  Created by Joe Blau on 8/31/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit
import MobileCoreServices

class AppWindow: UIWindow {

    fileprivate let hudObjects = HUDObjectsViewController()
    fileprivate let dashboardWindow = UIWindow(frame: UIScreen.main.bounds)

    override init(frame: CGRect) {
        super.init(frame: frame)
        hudObjects.actionable = self
        dashboardWindow.windowLevel = .statusBar
        let navController = UINavigationController(rootViewController: hudObjects)
        navController.navigationBar.barStyle = .blackTranslucent
        
        dashboardWindow.rootViewController = navController
        
        
        let screenEdge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(dispalyHud))
        screenEdge.edges = [.bottom]
        
        addGestureRecognizer(screenEdge)
        rootViewController = InitialViewController()

        let dropInteraction = UIDropInteraction(delegate: self)
        addInteraction(dropInteraction)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func dispalyHud() {
        dashboardWindow.makeKeyAndVisible()
    }
    
}

extension AppWindow: HUDObjectsActionable {
    func dismiss() {
        dashboardWindow.isHidden = true
    }
    
    func play() {
        // TODO:
    }
}
