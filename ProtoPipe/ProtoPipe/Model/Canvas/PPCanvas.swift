//
//  PPCanvas.swift
//  ProtoPipe
//
//  Created by 吉乞悠 on 2020/7/27.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

class PPCanvas: PPNode {
    
    var device: PPDevice
    
    init(name: String, device: PPDevice) {
        self.device = device
        
        super.init(type: PPNodeType.Canvas, name: name)
    }
    
    func addScene(scene: PPScene) {
        addChildNode(node: scene)
    }
    
}
