//
//  AppWindow+UIDropInteractionDelegate.swift
//  Moproto
//
//  Created by Joe Blau on 9/1/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

private let EDITOR_BUFFER: CGFloat = 12


extension AppWindow {
//extension AppWindow : UIDropInteractionDelegate {

    
//    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
//        return true
////        return session.hasItemsConforming(toTypeIdentifiers: ["MoprotoObjectType"]) && session.items.count == 1
//    }
//
//    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
//        return UIDropProposal(operation: .copy)
//    }

    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
//        session.loadObjects(ofClass: MoprotoObjectType.self) { (items) in
//            guard let firstItem = items.first as? MoprotoObjectType else { return }
//
//            switch firstItem.className {
//            case "UINavigationController":
//                let vc = WhiteViewController()
//                vc.title = "Change Me"
//                let nvc = UINavigationController(rootViewController: vc)
//                self.addViewController(viewController: nvc)
//
//            case "UITabBarController":
//                let tbc = UITabBarController()
//                tbc.view.backgroundColor = .white
//                let vc0 = WhiteViewController()
//                vc0.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.favorites, tag: 0)
//                let vc1 = WhiteViewController()
//                vc1.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.bookmarks, tag: 1)
//                let vc2 = WhiteViewController()
//                vc2.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.mostViewed, tag: 2)
//                let vc3 = WhiteViewController()
//                vc3.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.search, tag: 3)
//                tbc.viewControllers = [vc0, vc1, vc2, vc3]
//                self.addViewController(viewController: tbc)
//            case "UITableViewController":
////                let ds = UITableViewDesignersDataSource()
//                let tvc = DeferredTableViewController(dataSource: self.dataSources[0] as! UITableViewDesignersDataSource)
//                tvc.title = "Change Me"
//                self.addViewController(viewController: tvc)
//                
//            case "UIViewController":
//                let vc = WhiteViewController()
//                vc.title = "Change Me"
//                self.addViewController(viewController: vc)
//
//            case "UIButton":
//                let b = UIButton(type: .system)
//                b.setTitle("Button", for: .normal)
//                b.isEnabled = false
//                self.addView(view: b, performDrop: session)
//
//            case "UISegmentedControl":
//                let items = ["First", "Second", "Third"]
//                let sc = UISegmentedControl(items: items)
//                sc.isEnabled = false
//                self.addView(view: sc, performDrop: session)
//
//            case "UISlider":
//                let s = UISlider()
//                s.widthAnchor.constraint(equalToConstant: 128).isActive = true
//                s.isEnabled = false
//                self.addView(view: s, performDrop: session)
//            
//            case "UIStepper":
//                let s = UIStepper()
//                s.isEnabled = false
//                self.addView(view: s, performDrop: session)
//
//            case "UISwitch":
//                let s = UISwitch()
//                s.isEnabled = false
//                self.addView(view: s, performDrop: session)
//                
//            case "UIActivityIndicatorView":
//                let ai = UIActivityIndicatorView(style: .gray)
//                ai.hidesWhenStopped = false
//                self.addView(view: ai, performDrop: session)
//                
//            case "UILabel":
//                let l = UILabel()
//                l.text = "Label"
//                l.isEnabled = false
//                self.addView(view: l, performDrop: session)
//                
//            case "UIProgressView":
//                let p = UIProgressView()
//                p.progress = 0.5
//                p.widthAnchor.constraint(equalToConstant: 128).isActive = true
//                self.addView(view: p, performDrop: session)
//
//                
//            default: print("no op")
//            }
//        }
    }
    
    private func addViewController(viewController: UIViewController) {

        if rootViewController is InitialViewController {
            viewControllerTree = TreeNode(value: viewController)
            currentNode = viewControllerTree
            
            switch viewController {
            case let nc as UINavigationController:
                rootViewController = viewController
                currentView = nc.topViewController?.view
            case let tbc as UITabBarController:
                rootViewController = viewController
                currentView = tbc.viewControllers?.first?.view
            case let tvc as UITableViewController:
                rootViewController = UINavigationController(rootViewController: viewController)
                currentView = tvc.view
            default: break
            }
            return
        }
        
//        if let vc = self.rootViewController {
//            let ac = UIAlertController(title: "Transition", message: nil, preferredStyle: .actionSheet)
//            ac.addAction(UIAlertAction(title: "Replace", style: .destructive)  { (action) in
//                print("Replace")
//            })
//            ac.addAction(UIAlertAction(title: "Transition", style: .default) { (action) in
//                self.viewControllerTree?.addChild(TreeNode(value: viewController))
//                self.currentNode = self.viewControllerTree?.children.last
//                switch vc {
//                case let currentVC as UINavigationController:
//                    currentVC.pushViewController(viewController, animated: true)
//                default: break
//                }
//
//            })
//            ac.addAction(UIAlertAction(title: "Add", style: .default) { (action) in
//                
//            })
//            let aCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//            ac.addAction(aCancel)
//            vc.present(ac, animated: true, completion: nil)
//        }
        
        
    }
    
    private func addView(view: UIView, performDrop session: UIDropSession) {
        view.translatesAutoresizingMaskIntoConstraints = false
        let lev = view.liveEditView
        view.addSubview(lev)
        lev.topAnchor.constraint(equalTo: view.topAnchor, constant: -EDITOR_BUFFER).isActive = true
        lev.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: EDITOR_BUFFER).isActive = true
        lev.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -EDITOR_BUFFER).isActive = true
        lev.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: EDITOR_BUFFER).isActive = true
        
        if let topView = (self.rootViewController as? UINavigationController)?.topViewController?.view {
            topView.addSubview(view)
            let center = session.location(in: topView)
            view.centerYAnchor.constraint(equalTo: topView.topAnchor, constant: center.y).isActive = true
            view.centerXAnchor.constraint(equalTo: topView.leadingAnchor, constant: center.x).isActive = true
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
