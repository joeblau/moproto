//
//  HUDWindow.swift
//  Moproto
//
//  Created by Joe Blau on 12/2/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

class HUDWindow: UIWindow {

    private let touchVisualizer = TouchVisualizer()
    
    
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
