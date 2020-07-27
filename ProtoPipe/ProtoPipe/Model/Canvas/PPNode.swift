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
    
    weak var parentNode: PPNode?
    var childNodes: [PPNode] = []
    
    var position: CGPoint?
    var size: CGSize?
    
    init(name: String) {
        self.name = name
    }
    
    func addChildNode(node: PPNode) {
        node.parentNode = self
        childNodes.append(node)
    }
    
}
