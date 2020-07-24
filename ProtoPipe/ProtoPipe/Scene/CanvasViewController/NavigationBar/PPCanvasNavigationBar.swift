//
//  PPCanvasNavigationBar.swift
//  ProtoPipe
//
//  Created by CM on 2020/7/8.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit
import SnapKit

protocol PPCanvasNavigationBarDelegate: class {
    func canvasNavigationBarDidClickBackBtn(_ canvasNavigationBar: PPCanvasNavigationBar)
    func canvasNavigationBarDidClickSettingsBtn(_ canvasNavigationBar: PPCanvasNavigationBar)
    
    func canvasNavigationBarDidClickPageControl(_ canvasNavigationBar: PPCanvasNavigationBar, isSelected: [Bool])
}

class PPCanvasNavigationBar: UIView {
    
    weak var delegate: PPCanvasNavigationBarDelegate?
    
    var backButton: UIButton!
    var titleLbl: UILabel!
    var barItemButtons: [UIButton] = []
    var barPageControl: PPCanvasBarPageControl!

    init() {
        super.init(frame: CGRect())
        
        backgroundColor = .navigatorBlack
        
        // barPageControl
        barPageControl = PPCanvasBarPageControl()
        barPageControl.delegate = self
        addSubview(barPageControl)
        barPageControl.snp.makeConstraints { (make) in
            make.bottom.equalTo(-10)
            make.right.equalTo(-15)
        }
        
        // barItemButtons
        for i in 0...PPCanvasNavigationBar.BarItemButtonTypes.count - 1 {
            let barItemButton = makeBarItemButton(PPCanvasNavigationBar.BarItemButtonTypes[i], i)
            barItemButtons.append(barItemButton)
        }
        
        // backButton
        backButton = UIButton(type: .system)
        backButton.setImage(UIImage(named: "Back"), for: .normal)
        backButton.tintColor = .subtitleWhite
        backButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        addSubview(backButton)
        backButton.addTarget(self, action: #selector(backButtonDidClick(sender:)), for: .touchUpInside)
        backButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 50, height: 50))
            make.bottom.equalToSuperview()
            make.left.equalTo(6)
        }
        
        // titleLbl
        titleLbl = UILabel()
        titleLbl.text = "ProtoPipe 第一稿 ProtoPipe 第一稿 ProtoPipe 第一稿"
        titleLbl.textColor = .subtitleGray
        titleLbl.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        addSubview(titleLbl)
        titleLbl.snp.makeConstraints { (make) in
            make.left.equalTo(60)
            make.bottom.equalTo(-10)
            make.height.equalTo(30)
            make.right.equalTo(barItemButtons.last!.snp.left).offset(-50)
        }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

// MARK: - Static Model
extension PPCanvasNavigationBar {
    static let BarItemButtonTypes: [PPCanvasBarItemButtonType] = [.Settings, .Run, .Library]
}

// MARK: - Target Actions
enum PPCanvasBarItemButtonType: String {
    case Library  = "Library"
    case Settings = "Settings"
    case Run      = "Run"
}

extension PPCanvasNavigationBar {
    @objc func barItemButtonDidClick(sender: PPBarItemButton) {
        delegate?.canvasNavigationBarDidClickSettingsBtn(self)
    }
    
    @objc func backButtonDidClick(sender: UIButton) {
        delegate?.canvasNavigationBarDidClickBackBtn(self)
    }
}

// MARK: - Helpers
extension PPCanvasNavigationBar {
    private func makeBarItemButton(_ type: PPCanvasBarItemButtonType, _ i: Int) -> PPBarItemButton { let
        barItemButton = PPBarItemButton()
        barItemButton.setImage(UIImage(named: "BarItem_" + type.rawValue), for: .normal)
        barItemButton.addTarget(self, action: #selector(barItemButtonDidClick(sender:)), for: .touchUpInside)
        addSubview(barItemButton)
        barItemButton.snp.makeConstraints { (make) in make.bottom.equalTo(-10); make.right.equalTo(barPageControl.snp.left).offset(-12 - i * 70) }
        return barItemButton
    }
}

// MARK: -
extension PPCanvasNavigationBar: PPCanvasBarPageControlDelegate {
    func barPageControlDidClick(_ canvasBarPageControl: PPCanvasBarPageControl, isSelected: [Bool]) {
        delegate?.canvasNavigationBarDidClickPageControl(self, isSelected: isSelected)
    }
}
