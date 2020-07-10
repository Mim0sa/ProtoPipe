//
//  PPCanvasNavigationBar.swift
//  ProtoPipe
//
//  Created by CM on 2020/7/8.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

protocol PPCanvasNavigationBarDelegate: class {
    func canvasNavigationBarDidClickBackBtn(_ canvasNavigationBar: PPCanvasNavigationBar)
}

class PPCanvasNavigationBar: UIView {
    
    weak var delegate: PPCanvasNavigationBarDelegate?
    
    var barItemButtons: [UIButton] = []

    init() {
        super.init(frame: CGRect())
        
        backgroundColor = .navigatorBlack
        
        for i in 0...PPCanvasNavigationBar.BarItemButtonTypes.count - 1 {
            let btn = PPBarItemButton()
            addSubview(btn)
            btn.setImage(UIImage(named: "lib"), for: .normal)
            btn.addTarget(self, action: #selector(barItemButtonDidClick(sender:)), for: .touchUpInside)
            btn.snp.makeConstraints { (make) in
                make.bottom.equalTo(-10)
                make.right.equalTo(-12 + i * -70)
            }

            barItemButtons.append(btn)
        }
        
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}

// MARK: - Static Model
extension PPCanvasNavigationBar {
    static let BarItemButtonTypes: [PPCanvasBarItemButtonType] = [.Library, .Settings, .Run]
}

// MARK: - Target Actions
enum PPCanvasBarItemButtonType: String {
    case Library  = "Library"
    case Settings = "Settings"
    case Run      = "Run"
}

extension PPCanvasNavigationBar {
    @objc func barItemButtonDidClick(sender: PPBarItemButton) {
        
    }
}
