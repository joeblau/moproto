//
//  AppWindow+UIDropInteractionDelegate.swift
//  Moproto
//
//  Created by Joe Blau on 9/1/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

private let EDITOR_BUFFER: CGFloat = 12

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
                let vc = WhiteViewController()
                vc.title = "ChangeMe"
                self.rootViewController = UINavigationController(rootViewController: vc)

            case "UITabBarController":
                let vc0 = WhiteViewController()
                vc0.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.favorites, tag: 0)
                let vc1 = WhiteViewController()
                vc1.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.bookmarks, tag: 1)
                let vc2 = WhiteViewController()
                vc2.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.mostViewed, tag: 2)
                let vc3 = WhiteViewController()
                vc3.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.search, tag: 3)
                
                let tbc = UITabBarController()
                tbc.view.backgroundColor = .white
                tbc.viewControllers = [vc0, vc1, vc2, vc3]
                
                self.rootViewController = tbc

            case "UIButton":
                let b = UIButton(type: .system)
                b.setTitle("Button", for: .normal)
                self.addView(view: b, performDrop: session)

            case "UISegmentedControl":
                let items = ["First", "Second", "Third"]
                let sc = UISegmentedControl(items: items)
                self.addView(view: sc, performDrop: session)

            case "UISlider":
                let s = UISlider()
                s.widthAnchor.constraint(equalToConstant: 128).isActive = true
                self.addView(view: s, performDrop: session)
            
            case "UIStepper":
                self.addView(view: UIStepper(), performDrop: session)

            case "UISwitch":
                self.addView(view: UISwitch(), performDrop: session)
                
            case "UIActivityIndicatorView":
                let ai = UIActivityIndicatorView(style: .gray)
                ai.hidesWhenStopped = false
                self.addView(view: ai, performDrop: session)
                
            case "UILabel":
                let l = UILabel()
                l.text = "Label"
                self.addView(view: l, performDrop: session)
                
            case "UIProgressView":
                let p = UIProgressView()
                p.progress = 0.5
                p.widthAnchor.constraint(equalToConstant: 128).isActive = true
                self.addView(view: p, performDrop: session)

                
            default: print("no op")
            }
        }
    }
    
    private func addView(view: UIView, performDrop session: UIDropSession) {
        view.translatesAutoresizingMaskIntoConstraints = false
        if let topView = (self.rootViewController as? UINavigationController)?.topViewController?.view {
            topView.addSubview(view)
            let center = session.location(in: topView)
            view.centerYAnchor.constraint(equalTo: topView.topAnchor, constant: center.y).isActive = true
            view.centerXAnchor.constraint(equalTo: topView.leadingAnchor, constant: center.x).isActive = true
                        
            let lev = LiveEditorView(editable: view.editable)
            topView.addSubview(lev)
            lev.topAnchor.constraint(equalTo: view.topAnchor, constant: -EDITOR_BUFFER).isActive = true
            lev.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: EDITOR_BUFFER).isActive = true
            lev.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -EDITOR_BUFFER).isActive = true
            lev.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: EDITOR_BUFFER).isActive = true
        }
        if let selectedIndex = (self.rootViewController as? UITabBarController)?.selectedIndex,
            let topView = (self.rootViewController as? UITabBarController)?.viewControllers?[selectedIndex].view {
            topView.addSubview(view)
            let center = session.location(in: topView)
            view.centerYAnchor.constraint(equalTo: topView.topAnchor, constant: center.y).isActive = true
            view.centerXAnchor.constraint(equalTo: topView.leadingAnchor, constant: center.x).isActive = true
        }
    }
}
