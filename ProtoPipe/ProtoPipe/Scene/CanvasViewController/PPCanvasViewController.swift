//
//  PPCanvasViewController.swift
//  ProtoPipe
//
//  Created by 吉乞悠 on 2020/5/21.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit
import SnapKit

protocol PPCanvasViewControllerDelegate: class {
    func canvasViewControllerDidClickedFolderButton(_ vc: PPCanvasViewController)
}

class PPCanvasViewController: PPBaseViewController {
    
    let canvasNavigationBar = PPCanvasNavigationBar()
    
    weak var delegate: PPCanvasViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .sceneBlack
    
        canvasNavigationBar.delegate = self
        view.addSubview(canvasNavigationBar)
        canvasNavigationBar.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(0)
            make.height.equalTo(56)
        }
        
        let gridEdge: CGFloat = 20
        let path = UIBezierPath()
        for i in 0...Int(screenWidth / gridEdge) + 1 {
            path.move(to: CGPoint(x: CGFloat(i) * gridEdge - 10, y: 56))
            path.addLine(to: CGPoint(x: CGFloat(i) * gridEdge - 10, y: screenWidth))
        }
        for j in 0...Int(screenWidth / gridEdge) + 1 {
            path.move(to: CGPoint(x: 0, y: 66 + CGFloat(j) * gridEdge))
            path.addLine(to: CGPoint(x: screenWidth, y: 66 + CGFloat(j) * gridEdge))
        }
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = 1
        shapeLayer.strokeColor = UIColor(withHex: 0x202122).cgColor
        shapeLayer.path = path.cgPath
        shapeLayer.lineCap = .square
        shapeLayer.lineJoin = .bevel
        view.layer.addSublayer(shapeLayer)
    }
    
}

// MARK: - PPCanvasNavigationBarDelegate
extension PPCanvasViewController: PPCanvasNavigationBarDelegate {
    func canvasNavigationBarDidClickBackBtn(_ canvasNavigationBar: PPCanvasNavigationBar) {
        dismiss(animated: true, completion: nil)
    }
    
    func canvasNavigationBarDidClickSettingsBtn(_ canvasNavigationBar: PPCanvasNavigationBar) {
         let settingsToast = PPSettingsToast()
         present(settingsToast, animated: true, completion: nil)
    }
}
