//
//  PPInspectorPageView.swift
//  ProtoPipe
//
//  Created by CM on 2020/7/13.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

class PPInspectorPageView: UIView {
    
    var isShowing: Bool = false {
        willSet {
            if newValue == isShowing { return }
            
            snp.updateConstraints { (update) in
                if newValue {
                    update.right.equalToSuperview()
                } else {
                    update.right.equalTo(frame.width)
                }
            }
        }
    }

    init() {
        super.init(frame: CGRect())
        
        backgroundColor = .contentGray
        alpha = 0.3
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

}
