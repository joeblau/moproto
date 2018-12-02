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
        case is UIButton,
             is UILabel,
             is UIImageView:
            return Editable(radius: .small, dimensions: .horizontalAndVertical)
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
    
    func showVerticalCenterGuide() {
        if nil == layer.sublayers?.filter({ $0.isKind(of: VerticalGuideShapeLayer.self) }).first {
            let points = [CGPoint(x: center.x, y: 0),
                          CGPoint(x: center.x, y: bounds.height)]
            let lineLayer = VerticalGuideShapeLayer(points: points)
            layer.insertSublayer(lineLayer, at: 1)
        }
    }
    
    func removeVerticalCenterGuide() {
        layer.sublayers?.filter({ $0.isKind(of: VerticalGuideShapeLayer.self) }).first?.removeFromSuperlayer()
    }
    
    func showHorizontalCenterGuide() {
        if nil == layer.sublayers?.filter({ $0.isKind(of: HorizontalGuideShapeLayer.self) }).first {
            let points = [CGPoint(x: 0, y: center.y),
                          CGPoint(x: bounds.width, y: center.y)]
            let lineLayer = HorizontalGuideShapeLayer(points: points)
            layer.insertSublayer(lineLayer, at: 1)
        }
    }
    
    func removeHorizontalCenterGuide() {
        layer.sublayers?.filter({ $0.isKind(of: HorizontalGuideShapeLayer.self) }).first?.removeFromSuperlayer()
    }
}

