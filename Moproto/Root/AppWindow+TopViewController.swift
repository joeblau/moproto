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
        case is UITabBarController: return (rootViewController as? UITabBarController)?.viewControllers?.first
        default: return nil
        }
    }
}
