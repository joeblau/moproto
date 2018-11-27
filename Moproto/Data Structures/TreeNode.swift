//
//  TreeNode.swift
//  Moproto
//
//  Created by Joe Blau on 11/23/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import Foundation

public class TreeNode<T> {
    public var value: T
    
    public weak var parent: TreeNode?
    public var children = [TreeNode<T>]()
    
    public init(value: T) {
        self.value = value
    }
    
    public func addChild(_ node: TreeNode<T>) {
        children.append(node)
        node.parent = self
    }
}
