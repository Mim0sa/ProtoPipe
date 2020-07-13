//
//  PPCanvasGridLayer.swift
//  ProtoPipe
//
//  Created by CM on 2020/7/13.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

class PPCanvasGridLayer: CAShapeLayer {

    override init() {
        super.init()
        
        let gridEdge: CGFloat = 20
        let bpath = UIBezierPath()
        for i in 0...Int(screenWidth / gridEdge) {
            bpath.move(to: CGPoint(x: CGFloat(i) * gridEdge - 10, y: 56))
            bpath.addLine(to: CGPoint(x: CGFloat(i) * gridEdge - 10, y: screenWidth))
        }
        for j in 0...Int(screenWidth / gridEdge) {
            bpath.move(to: CGPoint(x: 0, y: 66 + CGFloat(j) * gridEdge))
            bpath.addLine(to: CGPoint(x: screenWidth, y: 66 + CGFloat(j) * gridEdge))
        }
        lineWidth = 1
        strokeColor = UIColor(withHex: 0x202122).cgColor
        path = bpath.cgPath
        lineCap = .square
        lineJoin = .bevel
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}
