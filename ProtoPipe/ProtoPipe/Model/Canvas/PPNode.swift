//
//  PPNode.swift
//  ProtoPipe
//
//  Created by CM on 2020/7/27.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

class PPNode {
    
    var name: String
    var uuid = UUID()
    
    var parentNode: PPNode?
    var childNodes: [PPNode] = []
    
    var position: CGPoint?
    var size: CGSize?
    
    init(name: String) {
        self.name = name
    }
    
    func addChildNode(node: PPNode) {
        childNodes.append(node)
    }
    
    func insertChildNode(node: PPNode, at index: Int) {
        childNodes.insert(node, at: index)
    }
    
    func removeChildNode(at index: Int) {
        childNodes.remove(at: index)
    }
    
}
