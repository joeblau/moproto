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

 private let touchVisualizer = TouchVisualizer()
    
    fileprivate let hudObjects = HUDObjectsViewController()
    fileprivate let hudWindow = HUDWindow(frame: UIScreen.main.bounds)
    
    internal var viewControllerTree: TreeNode<UIViewController>? = nil
    internal var currentNode: TreeNode<UIViewController>? = nil
    internal let dataSources = DataSourcesFactory.build()
    internal var activeView: UIView? = nil
    private var pan: UIPanGestureRecognizer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        hudWindow.windowLevel = .statusBar
        let navController = UINavigationController(rootViewController: hudObjects)
        navController.navigationBar.barStyle = .blackTranslucent
        
        hudWindow.rootViewController = navController
        pan = UIPanGestureRecognizer(target: self, action: #selector(didPan(recognizer:)))
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
        guard let topView = topViewController?.view else { return }
        let location = recognizer.location(in: topView)
        
        let activeViewConstraints = topView.constraints.filter { $0.firstItem?.isEqual(activeView) ?? false }
        guard let centerX = activeViewConstraints.filter({ $0.firstAttribute == .centerX }).first,
            let centerY = activeViewConstraints.filter({ $0.firstAttribute == .centerY }).first else { return }
        
        if (abs(location.x-topView.center.x) <= Constants.SNAP_PIXEL_BUFFER) {
            centerX.constant = topView.center.x
            showVerticalCenterGuide()
        } else {
            centerX.constant = location.x
            removeVerticalCenterGuide()
        }
        
        if (abs(location.y-topView.center.y) <= Constants.SNAP_PIXEL_BUFFER) {
            centerY.constant = topView.center.y
            showHorizontalCenterGuide()
        } else {
            centerY.constant = location.y
            removeHorizontalCenterGuide()
        }
    }
    
    @objc func didTap(recognizer: UITapGestureRecognizer) {
        guard let topView = topViewController?.view else { return }
        let location = recognizer.location(in: topView)
        var isAnyControlActive = false
        for currentView in topView.subviews {
            let adjustedLocation = topView.convert(location, to: currentView)
            switch currentView {
            case is UIButton where currentView.bounds.contains(adjustedLocation),
                is UISegmentedControl where currentView.bounds.contains(adjustedLocation),
                is UISlider where currentView.bounds.contains(adjustedLocation),
                is UIStepper where currentView.bounds.contains(adjustedLocation),
                is UISwitch where currentView.bounds.contains(adjustedLocation),
                is UIInitialControl where currentView.bounds.contains(adjustedLocation),
                is UIImageView where currentView.bounds.contains(adjustedLocation),
                is UILabel where currentView.bounds.contains(adjustedLocation):
                currentView.liveEditView.isHidden.toggle()
                switch currentView.liveEditView.isHidden {
                case true:
                    activeView = topView
                    currentView.liveEditView.removeGestureRecognizer(pan)
                    removeAllGuides()
                case false:
                    isAnyControlActive = true
                    activeView = currentView
                    currentView.liveEditView.addGestureRecognizer(pan)
                }
            default: currentView.liveEditView.isHidden = true
            }
            currentView.isUserInteractionEnabled = !currentView.liveEditView.isHidden
        }
        if !isAnyControlActive {
            activeView = topView
            removeAllGuides()
        }
    }
    
    
    
    internal func setGestureRecoginzersToTopView() {
        guard let topView = topViewController?.view else { return }
        activeView = topView
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap(recognizer:)))
        topViewController?.view.addGestureRecognizer(tap)
        let screenEdge =  UIScreenEdgePanGestureRecognizer(target: self, action: #selector(didEdgePan(recognizer:)))
        screenEdge.edges = [.bottom]
        topViewController?.view.addGestureRecognizer(screenEdge)
    }
    
    private func removeAllGuides() {
        removeVerticalCenterGuide()
        removeHorizontalCenterGuide()
    }
    
    // MARK: - Handle Events
    
    public override func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)
        guard let touches = event.allTouches else {
            return
        }
        
        for touch in touches {
            handleTouchVisualization(touch: touch)
        }
    }
    
    private func handleTouchVisualization(touch: UITouch) {
        guard let rootView = topViewController?.view else {
            return
        }
        switch touch.phase {
        case .began:
            touchVisualizer.createTouchVisualization(rootView: rootView, touch: touch, touchColor: .red)
        case .moved:
            touchVisualizer.moveTouchVisualization(rootView: rootView, touch: touch)
        case .stationary:
            break
        case .ended, .cancelled:
            touchVisualizer.removeTouchVisualization(touch: touch)
        }
    }
}
