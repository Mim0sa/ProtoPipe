//
//  PPScene.swift
//  ProtoPipe
//
//  Created by CM on 2020/7/27.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import Foundation

class PPScene: PPNode {
    
    init(name: String, canvas: PPCanvas) {
        super.init(name: name)
        
        parentNode = canvas
        size = canvas.device.screenSize
    }
    
}
