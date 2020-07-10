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
        
        // barItemButtons
        for i in 0...PPCanvasNavigationBar.BarItemButtonTypes.count - 1 {
            let barItemButton = makeBarItemButton(PPCanvasNavigationBar.BarItemButtonTypes[i], i)
            barItemButtons.append(barItemButton)
        }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

// MARK: - Static Model
extension PPCanvasNavigationBar {
    static let BarItemButtonTypes: [PPCanvasBarItemButtonType] = [.Run, .Settings, .Library]
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

// MARK: - Helpers
extension PPCanvasNavigationBar {
    private func makeBarItemButton(_ type: PPCanvasBarItemButtonType, _ i: Int) -> UIButton { let
        barItemButton = PPBarItemButton()
        barItemButton.setImage(UIImage(named: "BarItem_" + type.rawValue), for: .normal)
        barItemButton.addTarget(self, action: #selector(barItemButtonDidClick(sender:)), for: .touchUpInside)
        addSubview(barItemButton)
        barItemButton.snp.makeConstraints { (make) in make.bottom.equalTo(-10); make.right.equalTo( -12 + i * -70) }
        return barItemButton
    }
}
