//
//  PPCanvasBarPageControl.swift
//  ProtoPipe
//
//  Created by CM on 2020/7/24.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

protocol PPCanvasBarPageControlDelegate: class {
    func barPageControlDidClick(_ canvasBarPageControl: PPCanvasBarPageControl, isSelected: [Bool])
}

class PPCanvasBarPageControl: UIView {
    
    var leftPageControl: PPBarItemButton!
    var rightPageControl: PPBarItemButton!
    
    var isSelected: [Bool] = [] {
        willSet {
            leftPageControl.isSelected = newValue[0]
            rightPageControl.isSelected = newValue[1]
        }
    }
    
    weak var delegate: PPCanvasBarPageControlDelegate?

    init() {
        super.init(frame: CGRect())
        
        isSelected = [false, false]
        
        leftPageControl = makeBarItemButton()
        leftPageControl.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        leftPageControl.setImage(UIImage(named: "BarItem_LControl"), for: .normal)
        leftPageControl.setImage(UIImage(named: "BarItem_LControl_S"), for: .selected)
        leftPageControl.snp.makeConstraints { (make) in
            make.left.top.bottom.equalToSuperview()
        }
        
        rightPageControl = makeBarItemButton()
        rightPageControl.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        rightPageControl.setImage(UIImage(named: "BarItem_RControl"), for: .normal)
        rightPageControl.setImage(UIImage(named: "BarItem_RControl_S"), for: .selected)
        rightPageControl.snp.makeConstraints { (make) in
            make.right.bottom.equalToSuperview()
            make.left.equalTo(leftPageControl.snp.right).offset(2)
        }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    @objc func barItemButtonDidClick(sender: PPBarItemButton) {
        if sender == leftPageControl {
            isSelected[0].toggle()
        } else {
            isSelected[1].toggle()
        }
        
        delegate?.barPageControlDidClick(self, isSelected: isSelected)
    }

    private func makeBarItemButton() -> PPBarItemButton { let
        barItemButton = PPBarItemButton()
        barItemButton.addTarget(self, action: #selector(barItemButtonDidClick(sender:)), for: .touchUpInside)
        addSubview(barItemButton)
        return barItemButton
    }
}
