//
//  UIInitialControl.swift
//  Moproto
//
//  Created by Joe Blau on 11/27/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

class UIInitialControl: UIControl {

    private let imageView = UIImageView(image: UIImage(named: "add"))
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        imageView.tintColor = .lightGray
        addSubview(imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        widthAnchor.constraint(equalToConstant: Constants.INITIAL_CONTROL_WIDTH_HEIGHT).isActive = true
        heightAnchor.constraint(equalToConstant: Constants.INITIAL_CONTROL_WIDTH_HEIGHT).isActive = true
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: Constants.INITIAL_CONTROL_WIDTH_HEIGHT,
                      height: Constants.INITIAL_CONTROL_WIDTH_HEIGHT)
    }

}
