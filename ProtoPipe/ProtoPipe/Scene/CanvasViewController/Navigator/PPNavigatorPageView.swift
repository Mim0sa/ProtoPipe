//
//  PPNavigatorPageView.swift
//  ProtoPipe
//
//  Created by CM on 2020/7/13.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

class PPNavigatorPageView: PPBlurView {
    
    var isShowing: Bool = false {
        willSet {
            if newValue == isShowing { return }
            snp.updateConstraints { (update) in let _ = newValue ? update.left.equalToSuperview() : update.left.equalTo(-frame.width) }
        }
    }
    
    init() {
        super.init(style: .dark)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
