//
//  PPNode.swift
//  ProtoPipe
//
//  Created by 吉乞悠 on 2020/7/27.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

class PPNode {
    
    var name: String
    var type: PPNodeType
    var uuid = UUID()
    
    weak var parentNode: PPNode?
    var childNodes: [PPNode] = []
    
    var position: CGPoint?
    var size: CGSize?
    
    init(type: PPNodeType, name: String) {
        self.name = name
        self.type = type
    }
    
    func addChildNode(node: PPNode) {
        node.parentNode = self
        childNodes.append(node)
    }
    
}
