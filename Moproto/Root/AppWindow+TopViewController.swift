//
//  AppWindow+Extensions.swift
//  Moproto
//
//  Created by Joe Blau on 12/1/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

extension AppWindow {
    var topViewController: UIViewController? {
        switch rootViewController {
        case is InitialViewController: return rootViewController
        case is UINavigationController: return (rootViewController as? UINavigationController)?.topViewController
        case is UITabBarController:
            guard let tabBarController = (rootViewController as? UITabBarController) else { return nil }
            return tabBarController.viewControllers?[tabBarController.selectedIndex]
        default: return nil
        }
    }
}
