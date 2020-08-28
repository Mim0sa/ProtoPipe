//
//  PPCanvasView.swift
//  ProtoPipe
//
//  Created by CM on 2020/7/13.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

class PPCanvasView: UIView {
    
    var ratio: Int = 100 {
        didSet {
            UIView.animate(withDuration: 0.1) {
                self.transform = CGAffineTransform(scaleX: CGFloat(self.ratio) / 100.0, y: CGFloat(self.ratio) / 100.0)
            }
            
        }
    }
    
}
