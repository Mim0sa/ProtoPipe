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
    let navigatorPageView = PPNavigatorPageView()
    let inspectorPageView = PPInspectorPageView()
    
    weak var delegate: PPCanvasViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .sceneBlack
        
        // Grid Layer
        view.layer.addSublayer(PPCanvasGridLayer())
        
        view.layer.contents = UIImage(named: "pic")?.cgImage
        
        // Navigation Bar
        canvasNavigationBar.delegate = self
        view.addSubview(canvasNavigationBar)
        canvasNavigationBar.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(0)
            make.height.equalTo(56)
        }
        
        // Navigator Page
        view.addSubview(navigatorPageView)
        navigatorPageView.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.left.equalToSuperview().offset(-300)
            make.top.equalTo(canvasNavigationBar.snp.bottom)
            make.bottom.equalToSuperview()
        }
        
        // Inspector Page
        view.addSubview(inspectorPageView)
        inspectorPageView.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.right.equalToSuperview().offset(300)
            make.top.equalTo(canvasNavigationBar.snp.bottom)
            make.bottom.equalToSuperview()
        }
    }
    
}

// MARK: - PPCanvasNavigationBarDelegate
extension PPCanvasViewController: PPCanvasNavigationBarDelegate {
    func canvasNavigationBarDidClickBackBtn(_ canvasNavigationBar: PPCanvasNavigationBar) {
        dismiss(animated: true, completion: nil)
    }
    
    func canvasNavigationBarDidClickSettingsBtn(_ canvasNavigationBar: PPCanvasNavigationBar) {
        canvasNavigationBar.barPageControl.hideBarPageControls()
        
        let settingsToast = PPSettingsToast()
        present(settingsToast, animated: true, completion: nil)
    }
    
    func canvasNavigationBarDidChangePageControl(_ canvasNavigationBar: PPCanvasNavigationBar, isSelected: [Bool]) {
        navigatorPageView.isShowing = isSelected[0]
        inspectorPageView.isShowing = isSelected[1]
        UIView.animate(withDuration: 0.2) { self.view.layoutIfNeeded() }
    }
}
