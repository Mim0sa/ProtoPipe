//
//  PPScene.swift
//  ProtoPipe
//
//  Created by 吉乞悠 on 2020/7/27.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import Foundation

class PPScene: PPNode {
    
    init(name: String, canvas: PPCanvas) {
        super.init(type: PPNodeType.Scene, name: name)
        
        parentNode = canvas
        size = canvas.device.screenSize
    }
    
}
