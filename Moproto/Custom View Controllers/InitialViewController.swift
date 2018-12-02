//
//  InitialViewController.swift
//  Moproto
//
//  Created by Joe Blau on 8/31/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    fileprivate let noProjectLabel = UILabel()

    fileprivate let initialControl = UIInitialControl()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        noProjectLabel.translatesAutoresizingMaskIntoConstraints = false
        noProjectLabel.numberOfLines = 0
        noProjectLabel.textAlignment = .center
        noProjectLabel.alpha = 0
        noProjectLabel.textColor = UIColor.darkText
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap(recognizer:)))
        view.addGestureRecognizer(tap)
        
        configureViews()
        animateViews()
        updateInstructions()
    }

    fileprivate func configureViews() {
        view.addSubview(initialControl)
        initialControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        initialControl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        let lev = initialControl.liveEditView
        let dropInteraction = UIDropInteraction(delegate: self)
        lev.addInteraction(dropInteraction)
        
        view.addSubview(noProjectLabel)
        noProjectLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        noProjectLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        noProjectLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        noProjectLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
    }
    
    fileprivate func animateViews() {
        UIView.animate(withDuration: 0.3, delay: 1.4, options: .curveEaseIn, animations: {
            self.noProjectLabel.alpha = 1.0
        })
    }
    
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return .bottom
    }
    
    @objc func didTap(recognizer: UITapGestureRecognizer) {
        let location = recognizer.location(in: view)
        for currentView in self.view.subviews {
            let adjustedLocation = self.view.convert(location, to: currentView)
            switch currentView {
            case is UIInitialControl where currentView.bounds.contains(adjustedLocation):
                initialControl.liveEditView.isHidden.toggle()
                updateInstructions()
                return
            default: continue
            }
        }
    }
    
    private func updateInstructions() {
        switch initialControl.liveEditView.isHidden {
        case false:
            noProjectLabel.text = "Swipe up from bottom to select object, then drag and drop object on initial control."
            return
        default: noProjectLabel.text = "Tap to select the initial control."
        }
    }
}

extension InitialViewController: UIDropInteractionDelegate {
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.hasItemsConforming(toTypeIdentifiers: ["MoprotoViewControllerType"]) && session.items.count == 1
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        print("drop")
    }
}
