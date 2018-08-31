//
//  AppWindow.swift
//  Moproto
//
//  Created by Joe Blau on 8/31/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit


class AppWindow: UIWindow {

    fileprivate var visualizationWindow: UIWindow = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.isUserInteractionEnabled = false
        window.windowLevel = .statusBar
        window.rootViewController = HUDViewController()
        return window
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(dispalyHud))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.numberOfTouchesRequired = 1
        
        addGestureRecognizer(doubleTap)
        rootViewController = ViewController()

//
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func dispalyHud() {
        visualizationWindow.makeKeyAndVisible()
    }

}
