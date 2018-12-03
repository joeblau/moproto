//
//  MView.swift
//  Moproto
//
//  Created by Joe Blau on 12/2/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

class MView: UIView {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
