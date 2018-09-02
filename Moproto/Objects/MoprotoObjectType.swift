//
//  MoprotoObjectType.swift
//  Moproto
//
//  Created by Joe Blau on 9/1/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

final class MoprotoObjectType: NSObject {
    private(set) var className: String

    init(name: String) {
        className = name
    }
}

extension MoprotoObjectType: NSItemProviderWriting {
    static var writableTypeIdentifiersForItemProvider: [String] {
        return ["MoprotoObjectType"]
    }

    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
        completionHandler(className.data(using: .utf8) , nil)
        return Progress(totalUnitCount: 100)
    }
}

extension MoprotoObjectType: NSItemProviderReading {
    static var readableTypeIdentifiersForItemProvider: [String] {
        return ["MoprotoObjectType"]
    }

    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> MoprotoObjectType {
        let name = String(data: data, encoding: .utf8)
        return MoprotoObjectType(name: name!)
    }
}
