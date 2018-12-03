//
//  LiveEditorView.swift
//  Moproto
//
//  Created by Joe Blau on 11/21/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

class LiveEditorView: UIView {
    
    let parentEditable: Editable
    
    init(editable: Editable) {
        parentEditable = editable
        super.init(frame: .zero)
        contentMode = .redraw
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didPan() {
        print("PANNING")
    }
        
    fileprivate func renderHorizontalHandles(_ rect: CGRect) {
        let leftRectSize = CGRect(x: rect.origin.x,
                                  y: (rect.size.height/2) - (Constants.EDITOR_HANDLE_HEIGHT/2),
                                  width: Constants.EDITOR_HANDLE_WIDTH,
                                  height: Constants.EDITOR_HANDLE_HEIGHT)
        let leftHandle = UIBezierPath(roundedRect: leftRectSize, cornerRadius: Constants.EDITOR_HANDLE_WIDTH/2)
        UIColor(named: "edit-handle")?.setFill()
        leftHandle.fill()
        
        let rightRectSize = CGRect(x: rect.size.width - Constants.EDITOR_HANDLE_WIDTH,
                                   y: (rect.size.height/2) - (Constants.EDITOR_HANDLE_HEIGHT/2),
                                   width: Constants.EDITOR_HANDLE_WIDTH,
                                   height: Constants.EDITOR_HANDLE_HEIGHT)
        let rightHandle = UIBezierPath(roundedRect: rightRectSize, cornerRadius: Constants.EDITOR_HANDLE_WIDTH/2)
        UIColor(named: "edit-handle")?.setFill()
        rightHandle.fill()
    }
    
    fileprivate func renderVerticalHandles(_ rect: CGRect) {
        let topRectSize = CGRect(x: (rect.size.width/2) - (Constants.EDITOR_HANDLE_HEIGHT/2),
                                 y: rect.origin.y,
                                 width: Constants.EDITOR_HANDLE_HEIGHT,
                                 height: Constants.EDITOR_HANDLE_WIDTH)
        let topHandle = UIBezierPath(roundedRect: topRectSize, cornerRadius: Constants.EDITOR_HANDLE_WIDTH/2)
        UIColor(named: "edit-handle")?.setFill()
        topHandle.fill()
        
        let bottomRectSize = CGRect(x: (rect.size.width/2) - (Constants.EDITOR_HANDLE_HEIGHT/2),
                                    y: rect.size.height - Constants.EDITOR_HANDLE_WIDTH,
                                    width: Constants.EDITOR_HANDLE_HEIGHT,
                                    height: Constants.EDITOR_HANDLE_WIDTH)
        let bottomHandle = UIBezierPath(roundedRect: bottomRectSize, cornerRadius: Constants.EDITOR_HANDLE_WIDTH/2)
        UIColor(named: "edit-handle")?.setFill()
        bottomHandle.fill()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let dottedSelectionInsetRect = rect.insetBy(dx: Constants.EDITOR_HANDLE_WIDTH/2, dy: Constants.EDITOR_HANDLE_WIDTH/2)
        let dottedSelection = UIBezierPath(roundedRect: dottedSelectionInsetRect, cornerRadius: parentEditable.radius.rawValue)
        dottedSelection.lineWidth = Constants.EDITOR_LINE_WIDTH
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
