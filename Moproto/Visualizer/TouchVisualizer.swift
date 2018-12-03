//
//  TouchVisualizer.swift
//  Moproto
//
//  Created by Joe Blau on 12/2/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//


import UIKit

private struct TouchAnimationSettings {
    let opacityTo: CGFloat
    let borderWidthTo: CGFloat
    let scaleTo: CGFloat
    let duration: TimeInterval
}

class TouchVisualizer {
    
    private let animationGroup: CAAnimationGroup = {
        let group = CAAnimationGroup()
        group.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        group.isRemovedOnCompletion = false
        group.fillMode = .forwards
        return group
    }()
    private var touchPointViews = [UITouch: UIView]()
    
    // MARK: - Public
    
    func createTouchVisualization(rootView: UIView, touch: UITouch, touchColor: UIColor?) {
        let touchPointView = self.newTouchPointView(touchColor: touchColor)
        touchPointView.center = touch.location(in: rootView)
        
        touchPointViews[touch] = touchPointView
        rootView.addSubview(touchPointView)
        
        let animationSettings = TouchAnimationSettings(opacityTo: 0.7, borderWidthTo: 24, scaleTo: 0.4, duration: 0.1)
        let group = generateBasicAnimations(settings: animationSettings)
        touchPointView.layer.add(group, forKey: "touchZoomIn")
    }
    
    func moveTouchVisualization(rootView: UIView, touch: UITouch) {
        guard let touchView = touchPointViews[touch] else {
            return
        }
        touchView.center = touch.location(in: rootView)
    }
    
    func removeTouchVisualization(touch: UITouch) {
        touchPointViews[touch]?.layer.backgroundColor = UIColor.clear.cgColor
        
        let animationSettings = TouchAnimationSettings(opacityTo: 0.2, borderWidthTo: 0, scaleTo: 1.4, duration: 0.3)
        let group = generateBasicAnimations(settings: animationSettings)
        touchPointViews[touch]?.layer.add(group, forKey: "touchZoomOut")
        touchPointViews.removeValue(forKey: touch)
    }
    
    // MARK: - Private
    
    private func generateBasicAnimations(settings: TouchAnimationSettings) -> CAAnimationGroup {
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.toValue = settings.opacityTo
        
        let borderAnimation = CABasicAnimation(keyPath: "borderWidth")
        borderAnimation.toValue = settings.borderWidthTo
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.toValue = settings.scaleTo
        
        animationGroup.duration = settings.duration
        animationGroup.animations = [borderAnimation, scaleAnimation, opacityAnimation]
        return animationGroup
    }
    
    private func newTouchPointView(touchColor: UIColor?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        view.layer.backgroundColor = touchColor?.cgColor ?? view.tintColor.cgColor
        view.layer.borderWidth = 1
        view.layer.borderColor = touchColor?.cgColor ?? view.tintColor.cgColor
        view.layer.cornerRadius = view.frame.height / 2
        view.layer.opacity = 0.1
        return view
    }
}
