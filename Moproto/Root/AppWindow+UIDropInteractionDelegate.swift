//
//  AppWindow+UIDropInteractionDelegate.swift
//  Moproto
//
//  Created by Joe Blau on 9/1/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

extension AppWindow: UIDropInteractionDelegate {
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.hasItemsConforming(toTypeIdentifiers: ["MoprotoObjectType"]) && session.items.count == 1
    }

    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }

    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        session.loadObjects(ofClass: MoprotoObjectType.self) { (items) in
            guard let firstItem = items.first as? MoprotoObjectType else { return }

            switch firstItem.className {
            case "UINavigationController":
                let vc = UIViewController()
                vc.view.backgroundColor = .white
                vc.title = "ChangeMe"
                self.rootViewController = UINavigationController(rootViewController: vc)

            case "UITabBarController":
                let vc0 = BlankViewController()
                vc0.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.favorites, tag: 0)
                let vc1 = BlankViewController()
                vc1.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.bookmarks, tag: 1)
                let vc2 = BlankViewController()
                vc2.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.mostViewed, tag: 2)
                let vc3 = BlankViewController()
                vc3.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.search, tag: 3)
                
                let tbc = UITabBarController()
                tbc.view.backgroundColor = .white
                tbc.viewControllers = [vc0, vc1, vc2, vc3]
                
                self.rootViewController = tbc
                
            case "UIButton":
                let b = UIButton(type: .system)
                b.setTitle("Button", for: .normal)
                b.sizeToFit()
                self.addControl(control: b, performDrop: session)

            case "UISegmentedControl":
                let items = ["First", "Second", "Third"]
                let sc = UISegmentedControl(items: items)
                sc.sizeToFit()
                self.addControl(control: sc, performDrop: session)
                
            default: print("no op")
            }
        }
    }
    
    private func addControl(control: UIControl, performDrop session: UIDropSession) {
        if let topView = (self.rootViewController as? UINavigationController)?.topViewController?.view {
            topView.addSubview(control)
            control.center = session.location(in: topView)
        }
        if let selectedIndex = (self.rootViewController as? UITabBarController)?.selectedIndex,
            let topView = (self.rootViewController as? UITabBarController)?.viewControllers?[selectedIndex].view {
            topView.addSubview(control)
            control.center = session.location(in: topView)
        }
    }
}
