//
//  UIView+Extension.swift
//  Moproto
//
//  Created by Joe Blau on 11/21/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

private let EDITOR_BUFFER: CGFloat = 12

extension UIView {
    var editable: Editable {
        switch self {
        case is UISegmentedControl,
             is UIStepper:
            return Editable(radius: .medium, dimensions: .horizontal)
        case is UISlider:
            return Editable(radius: .large, dimensions: .horizontal)
        case is UISwitch,
             is UIActivityIndicatorView:
            return Editable(radius: .large, dimensions: .none)
        case is UIProgressView:
            return Editable(radius: .zero, dimensions: .horizontal)
        default:
            return Editable(radius: .small, dimensions: .none)
        }
    }
    
    var liveEditView: LiveEditorView {
        guard let existingLiveEditView = subviews.filter({ $0.isKind(of: LiveEditorView.self) }).first as? LiveEditorView else {
            let newLiveEditView = LiveEditorView(editable: self.editable)
            addSubview(newLiveEditView)
            newLiveEditView.topAnchor.constraint(equalTo: topAnchor, constant: -EDITOR_BUFFER).isActive = true
            newLiveEditView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: EDITOR_BUFFER).isActive = true
            newLiveEditView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -EDITOR_BUFFER).isActive = true
            newLiveEditView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: EDITOR_BUFFER).isActive = true
            newLiveEditView.isHidden = true
            return newLiveEditView
        }
        return existingLiveEditView
    }
}

