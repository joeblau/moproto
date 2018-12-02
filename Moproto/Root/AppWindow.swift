//
//  AppWindow.swift
//  Moproto
//
//  Created by Joe Blau on 8/31/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit
import MobileCoreServices

private let EDITOR_BUFFER: CGFloat = 12

class AppWindow: UIWindow {

    fileprivate let hudObjects = HUDObjectsViewController()
    fileprivate let hudWindow = UIWindow(frame: UIScreen.main.bounds)
    
    internal var currentView: UIView? = nil
    internal var viewControllerTree: TreeNode<UIViewController>? = nil
    internal var currentNode: TreeNode<UIViewController>? = nil
    internal let dataSources = DataSourcesFactory.build()
    private var liveEdit: LiveEditorView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        hudObjects.actionable = self
        hudWindow.windowLevel = .statusBar
        let navController = UINavigationController(rootViewController: hudObjects)
        navController.navigationBar.barStyle = .blackTranslucent
        
        hudWindow.rootViewController = navController
        
//        let pan = UIPanGestureRecognizer(target: self, action: #selector(didPan(recognizer:)))
//        addGestureRecognizer(pan)
        
        let screenEdge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(didEdgePan(recognizer:)))
        screenEdge.edges = [.bottom]
        addGestureRecognizer(screenEdge)
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap(recognizer:)))
//        addGestureRecognizer(tap)
        
        rootViewController = InitialViewController()
        topViewController?.attachDropDelegates(delegate: self)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func didEdgePan(recognizer: UIScreenEdgePanGestureRecognizer) {
        hudWindow.makeKeyAndVisible()
    }
    
//    @objc func didPan(recognizer: UIPanGestureRecognizer) {
////        trailingConstraint?.constant = 100z        liveEdit?.bounds
//        let currentLocation = recognizer.location(in: liveEdit)
//        print(currentLocation)
//        switch recognizer.state {
//        case .began:
//            initialLocation = currentLocation
//            selectedEdge = .left
//        case .changed:
////            print("\(-EDITOR_BUFFER) : \(initialLocation.x) : \(currentLocation.x)")
////            print(initialLocation.x + currentLocation.x)
//            guard let selectedEdge = selectedEdge else { return }
//            switch selectedEdge {
//            case .left: leadingConstraint?.constant = -EDITOR_BUFFER - (initialLocation.x + currentLocation.x)
////            case .right: trailingConstraint?.constant = EDITOR_BUFFER + initialLocation.x + currentLocation.x
////            case .top: topConstraint?.constant = -EDITOR_BUFFER + initialLocation.y + currentLocation.y
////            case .bottom: bottomConstraint?.constant = EDITOR_BUFFER + initialLocation.y + currentLocation.y
//            default: break
//            }
////
//        default: break
//        }
//    }
    
    @objc func didTap(recognizer: UITapGestureRecognizer) {
        if let liveEdit = self.liveEdit {
            liveEdit.removeFromSuperview()
            self.liveEdit = nil
            return
        }
        guard let topView = currentView else { return }
        let location = recognizer.location(in: currentView)
        for currentView in topView.subviews {
            let adjustedLocation = topView.convert(location, to: currentView)
            
            switch currentView {
            case is UIButton where currentView.bounds.contains(adjustedLocation),
                is UISegmentedControl where currentView.bounds.contains(adjustedLocation),
                is UISlider where currentView.bounds.contains(adjustedLocation),
                is UIStepper where currentView.bounds.contains(adjustedLocation),
                is UISwitch where currentView.bounds.contains(adjustedLocation):
                currentView.liveEditView.isHidden.toggle()
                return
            default: continue
            }
        }
    }
    
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        let hitView = super.hitTest(point, with: event)
//
//        if hitView!.isKind(of: UIControl.self ) {
//            return nil
//        }
//        return hitView
//    }
}

extension AppWindow: HUDObjectsActionable {
    
    func play() {
        // TODO:
    }
}
