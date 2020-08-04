//
//  PPCanvasBarZoomControl.swift
//  ProtoPipe
//
//  Created by 吉乞悠 on 2020/7/30.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

class PPCanvasBarZoomControl: UIView {
    
    var plusControl: UIButton!
    var minusControl: UIButton!
    
    var ratioLbl: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .sceneBlack
        
        layer.cornerRadius = 6
        
        snp.makeConstraints { (make) in make.size.equalTo(CGSize(width: 110, height: 30)) }
        
        plusControl = UIButton()
        plusControl.layer.cornerRadius = 6
        plusControl.backgroundColor = .textFieldGray
        plusControl.setImage(#imageLiteral(resourceName: "minus"), for: .normal)
        plusControl.imageEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        addSubview(plusControl)
        plusControl.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(0)
            make.width.equalTo(plusControl.snp.height)
        }
        
        minusControl = UIButton()
        minusControl.layer.cornerRadius = 6
        minusControl.backgroundColor = .textFieldGray
        minusControl.setImage(#imageLiteral(resourceName: "plus"), for: .normal)
        minusControl.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        addSubview(minusControl)
        minusControl.snp.makeConstraints { (make) in
            make.top.right.bottom.equalTo(0)
            make.width.equalTo(minusControl.snp.height)
        }
        
        ratioLbl = UILabel()
        ratioLbl.text = "80%"
        ratioLbl.textColor = .smokeGray
        ratioLbl.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        ratioLbl.textAlignment = .center
        addSubview(ratioLbl)
        ratioLbl.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
