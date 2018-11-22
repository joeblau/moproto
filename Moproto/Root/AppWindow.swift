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
        
//        let pan = UIPanGestureRecognizer(target: self, action: #selector(didPan(recognizer:)))
//        addGestureRecognizer(pan)
        
        let screenEdge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(didEdgePan(recognizer:)))
        screenEdge.edges = [.bottom]
        addGestureRecognizer(screenEdge)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap(recognizer:)))
        addGestureRecognizer(tap)
        
        rootViewController = InitialViewController()

        let dropInteraction = UIDropInteraction(delegate: self)
        addInteraction(dropInteraction)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func didEdgePan(recognizer: UIScreenEdgePanGestureRecognizer) {
        dashboardWindow.makeKeyAndVisible()
    }
    
    @objc func didPan(recognizer: UIPanGestureRecognizer) {
        
    }
    
    @objc func didTap(recognizer: UITapGestureRecognizer) {

        print(recognizer.view)
        
//            let lev = LiveEditorView(editable: view.editable)
//        topView.addSubview(lev)
//        lev.topAnchor.constraint(equalTo: view.topAnchor, constant: -EDITOR_BUFFER).isActive = true
//        lev.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: EDITOR_BUFFER).isActive = true
//        lev.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -EDITOR_BUFFER).isActive = true
//        lev.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: EDITOR_BUFFER).isActive = true
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
