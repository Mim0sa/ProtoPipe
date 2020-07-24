//
//  PPInspectorPageView.swift
//  ProtoPipe
//
//  Created by CM on 2020/7/13.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

class PPInspectorPageView: PPBlurView {
    
    var isShowing: Bool = false {
        willSet {
            if newValue == isShowing { return }
            snp.updateConstraints { (update) in let _ = newValue ? update.right.equalToSuperview() : update.right.equalTo(frame.width) }
        }
    }

    init() {
        super.init(style: .dark)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

}
