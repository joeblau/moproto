//
//  MoprotoGestureType.swift
//  Moproto
//
//  Created by Joe Blau on 12/1/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

final class MoprotoGestureType: NSObject {
    private(set) var className: String
    
    init(name: String) {
        className = name
    }
}

extension MoprotoGestureType: NSItemProviderWriting {
    static var writableTypeIdentifiersForItemProvider: [String] {
        return ["MoprotoGestureType"]
    }
    
    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
        completionHandler(className.data(using: .utf8) , nil)
        return Progress(totalUnitCount: 100)
    }
}

extension MoprotoGestureType: NSItemProviderReading {
    static var readableTypeIdentifiersForItemProvider: [String] {
        return ["MoprotoGestureType"]
    }
    
    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> MoprotoGestureType {
        let name = String(data: data, encoding: .utf8)
        return MoprotoGestureType(name: name!)
    }
}
