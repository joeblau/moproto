//
//  String+Extensions.swift
//  Moproto
//
//  Created by Joe Blau on 8/31/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import Foundation

extension String {
    var localize: String {
        return NSLocalizedString(self, comment: self)
    }
}
