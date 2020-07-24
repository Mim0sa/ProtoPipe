//
//  PPBlurView.swift
//  ProtoPipe
//
//  Created by CM on 2020/7/24.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

class PPBlurView: UIView {
    
    var contentView: UIVisualEffectView!
    
    init(style: UIBlurEffect.Style) {
        super.init(frame: CGRect())
            
        let blurEffect = UIBlurEffect(style: style)
        contentView = UIVisualEffectView(effect: blurEffect)
        addSubview(contentView)
        contentView.snp.makeConstraints { (make) in make.edges.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}
