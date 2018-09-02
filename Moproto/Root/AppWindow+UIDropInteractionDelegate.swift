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

            case "UIButton":
                let b = UIButton(type: .system)
                b.setTitle("Button", for: .normal)
                b.sizeToFit()

                if let topView = (self.rootViewController as! UINavigationController).topViewController?.view {
                    let location = session.location(in: topView)

                    topView.addSubview(b)
                    b.center = location
                }

            default: print("no op")
            }
        }
    }
}
