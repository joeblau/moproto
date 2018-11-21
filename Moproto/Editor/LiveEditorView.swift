//
//  LiveEditorView.swift
//  Moproto
//
//  Created by Joe Blau on 11/21/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

private let LINE_WIDTH: CGFloat = 2
private let HANDLE_WIDTH: CGFloat = 6
private let HANDLE_HEIGHT: CGFloat = 24

class LiveEditorView: UIView {
    
    let parentEditable: Editable
    
    init(editable: Editable) {
        parentEditable = editable
        super.init(frame: .zero)
        backgroundColor = .clear
        clipsToBounds = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func renderHorizontalHandles(_ rect: CGRect) {
        let leftRectSize = CGRect(x: rect.origin.x, y: (rect.size.height/2) - (HANDLE_HEIGHT/2), width: HANDLE_WIDTH, height: HANDLE_HEIGHT)
        let leftHandle = UIBezierPath(roundedRect: leftRectSize, cornerRadius: HANDLE_WIDTH/2)
        self.tintColor.setFill()
        leftHandle.fill()
        
        let rightRectSize = CGRect(x: rect.size.width - HANDLE_WIDTH, y: (rect.size.height/2) - (HANDLE_HEIGHT/2) , width: HANDLE_WIDTH, height: HANDLE_HEIGHT)
        let rightHandle = UIBezierPath(roundedRect: rightRectSize, cornerRadius: HANDLE_WIDTH/2)
        self.tintColor.setFill()
        rightHandle.fill()
    }
    
    fileprivate func renderVerticalHandles(_ rect: CGRect) {
        let topRectSize = CGRect(x: (rect.size.width/2) - (HANDLE_HEIGHT/2), y: rect.origin.y, width: HANDLE_HEIGHT, height: HANDLE_WIDTH)
        let topHandle = UIBezierPath(roundedRect: topRectSize, cornerRadius: HANDLE_WIDTH/2)
        self.tintColor.setFill()
        topHandle.fill()
        
        let bottomRectSize = CGRect(x: (rect.size.width/2) - (HANDLE_HEIGHT/2), y: rect.size.height - HANDLE_WIDTH, width: HANDLE_HEIGHT, height: HANDLE_WIDTH)
        let bottomHandle = UIBezierPath(roundedRect: bottomRectSize, cornerRadius: HANDLE_WIDTH/2)
        self.tintColor.setFill()
        bottomHandle.fill()
    }
    
    override func draw(_ rect: CGRect) {
        let dottedSelectionInsetRect = rect.insetBy(dx: HANDLE_WIDTH/2, dy: HANDLE_WIDTH/2)
        let dottedSelection = UIBezierPath(roundedRect: dottedSelectionInsetRect, cornerRadius: parentEditable.radius.rawValue)
        dottedSelection.lineWidth = LINE_WIDTH
        dottedSelection.lineCapStyle = .round
        UIColor.lightGray.withAlphaComponent(0.7).setStroke()
        let dashPattern : [CGFloat] = [6, 6]
        dottedSelection.setLineDash(dashPattern, count: dashPattern.count, phase: 0)
        dottedSelection.stroke()
        
        switch parentEditable.dimensions {
        case .horizontal:
            renderHorizontalHandles(rect)
        case .vertical:
            renderVerticalHandles(rect)
        case .horizontalAndVertical:
            renderHorizontalHandles(rect)
            renderVerticalHandles(rect)
        default: break
        }

    }

}
