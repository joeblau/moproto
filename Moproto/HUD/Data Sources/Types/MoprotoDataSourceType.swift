//
//  MoprotoDataSourceType.swift
//  Moproto
//
//  Created by Joe Blau on 12/1/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import UIKit

final class MoprotoDataSourceType: NSObject {
    private(set) var className: String
    
    init(name: String) {
        className = name
    }
}

extension MoprotoDataSourceType: NSItemProviderWriting {
    static var writableTypeIdentifiersForItemProvider: [String] {
        return ["MoprotoDataSourceType"]
    }
    
    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
        completionHandler(className.data(using: .utf8) , nil)
        return Progress(totalUnitCount: 100)
    }
}

extension MoprotoDataSourceType: NSItemProviderReading {
    static var readableTypeIdentifiersForItemProvider: [String] {
        return ["MoprotoDataSourceType"]
    }
    
    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> MoprotoDataSourceType {
        let name = String(data: data, encoding: .utf8)
        return MoprotoDataSourceType(name: name!)
    }
}
