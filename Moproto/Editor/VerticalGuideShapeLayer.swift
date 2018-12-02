//
//  VerticalGuideShapeLayer.swift
//  Moproto
//
//  Created by Joe Blau on 12/2/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

class VerticalGuideShapeLayer: CAShapeLayer {
    init(points: [CGPoint]) {
        super.init()
        strokeColor = UIColor.magenta.cgColor
        lineWidth = 1
        let mutablePath = CGMutablePath()
        mutablePath.addLines(between: points)
        self.path = mutablePath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
