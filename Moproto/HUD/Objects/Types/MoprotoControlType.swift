//
//  MoprotoControlType.swift
//  Moproto
//
//  Created by Joe Blau on 9/1/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

final class MoprotoControlType: NSObject {
    private(set) var className: String
    
    init(name: String) {
        className = name
    }
}

extension MoprotoControlType: NSItemProviderWriting {
    static var writableTypeIdentifiersForItemProvider: [String] {
        return ["MoprotoControlType"]
    }

    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
        completionHandler(className.data(using: .utf8) , nil)
        return Progress(totalUnitCount: 100)
    }
}

extension MoprotoControlType: NSItemProviderReading {
    static var readableTypeIdentifiersForItemProvider: [String] {
        return ["MoprotoControlType"]
    }

    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> MoprotoControlType {
        let name = String(data: data, encoding: .utf8)
        return MoprotoControlType(name: name!)
    }
}
