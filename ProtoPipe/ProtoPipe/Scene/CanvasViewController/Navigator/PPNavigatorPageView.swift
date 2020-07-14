//
//  PPNavigatorPageView.swift
//  ProtoPipe
//
//  Created by CM on 2020/7/13.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

class PPNavigatorPageView: UIView {

    init() {
        super.init(frame: CGRect())
        
        backgroundColor = .contentGray
        alpha = 0.3
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
