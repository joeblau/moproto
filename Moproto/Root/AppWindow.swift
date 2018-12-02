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
    
    internal var viewControllerTree: TreeNode<UIViewController>? = nil
    internal var currentNode: TreeNode<UIViewController>? = nil
    internal let dataSources = DataSourcesFactory.build()
    private var liveEdit: LiveEditorView?
    internal var activeView: UIView? = nil
    private var pan: UIPanGestureRecognizer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        hudWindow.windowLevel = .statusBar
        let navController = UINavigationController(rootViewController: hudObjects)
        navController.navigationBar.barStyle = .blackTranslucent
        
        hudWindow.rootViewController = navController
        
        pan = UIPanGestureRecognizer(target: self, action: #selector(didPan(recognizer:)))
        
        let screenEdge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(didEdgePan(recognizer:)))
        screenEdge.edges = [.bottom]
        addGestureRecognizer(screenEdge)
        
        rootViewController = InitialViewController(dropDelegate: self)
        setGestureRecoginzersToTopView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func didEdgePan(recognizer: UIScreenEdgePanGestureRecognizer) {
        hudWindow.makeKeyAndVisible()
    }
    
    @objc func didPan(recognizer: UIPanGestureRecognizer) {
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
    }
    
    @objc func didTap(recognizer: UITapGestureRecognizer) {
        guard let topView = topViewController?.view else { return }
        let location = recognizer.location(in: topView)
        for currentView in topView.subviews {
            let adjustedLocation = topView.convert(location, to: currentView)
            switch currentView {
            case is UIButton where currentView.bounds.contains(adjustedLocation),
                is UISegmentedControl where currentView.bounds.contains(adjustedLocation),
                is UISlider where currentView.bounds.contains(adjustedLocation),
                is UIStepper where currentView.bounds.contains(adjustedLocation),
                is UISwitch where currentView.bounds.contains(adjustedLocation),
                is UIInitialControl where currentView.bounds.contains(adjustedLocation):
                currentView.liveEditView.isHidden.toggle()
                switch currentView.liveEditView.isHidden {
                case true:
                    activeView = topView
                    currentView.liveEditView.removeGestureRecognizer(pan)
                case false:
                    activeView = currentView
                    currentView.liveEditView.addGestureRecognizer(pan)

                }
                
                
                activeView = currentView.liveEditView.isHidden ? topView : currentView
            default: currentView.liveEditView.isHidden = true
            }
        }
    }
    
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        let hitView = super.hitTest(point, with: event)
//
//        if hitView!.isKind(of: UIButton.self ) {
//            return nil
//        }
//        return hitView
//    }
    
    internal func setGestureRecoginzersToTopView() {
        guard let topView = topViewController?.view else { return }
        activeView = topView
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap(recognizer:)))
        topViewController?.view.addGestureRecognizer(tap)
    }
}
