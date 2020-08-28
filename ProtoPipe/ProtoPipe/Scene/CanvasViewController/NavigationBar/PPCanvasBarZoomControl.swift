//
//  PPCanvasBarZoomControl.swift
//  ProtoPipe
//
//  Created by 吉乞悠 on 2020/7/30.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

protocol PPCanvasBarZoomControlDelegate: class {
    func zoomControlDidUpdateRatio(_ zoomControl: PPCanvasBarZoomControl, ratio: Int)
}

class PPCanvasBarZoomControl: UIView {
    
    var plusControl: UIButton!
    var minusControl: UIButton!
    
    var ratio: Int = 100 {
        didSet {
            ratioLbl.text = "\(ratio)%"
        }
    }
    
    var ratioLbl: UILabel!
    
    var timer: Timer?
    
    weak var delegate: PPCanvasBarZoomControlDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .sceneBlack
        
        layer.cornerRadius = 6
        
        snp.makeConstraints { (make) in make.size.equalTo(CGSize(width: 110, height: 30)) }
        
        plusControl = UIButton()
        plusControl.tag = 500
        plusControl.layer.cornerRadius = 6
        plusControl.backgroundColor = .textFieldGray
        plusControl.setImage(#imageLiteral(resourceName: "minus"), for: .normal)
        plusControl.imageEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        addSubview(plusControl)
        plusControl.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(0)
            make.width.equalTo(plusControl.snp.height)
        }
        plusControl.addTarget(self, action: #selector(touchDown(sender:)), for: .touchDown)
        plusControl.addTarget(self, action: #selector(touchUp(sender:)), for: [.touchUpInside, .touchDragOutside])
        
        minusControl = UIButton()
        minusControl.tag = 501
        minusControl.layer.cornerRadius = 6
        minusControl.backgroundColor = .textFieldGray
        minusControl.setImage(#imageLiteral(resourceName: "plus"), for: .normal)
        minusControl.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        addSubview(minusControl)
        minusControl.snp.makeConstraints { (make) in
            make.top.right.bottom.equalTo(0)
            make.width.equalTo(minusControl.snp.height)
        }
        minusControl.addTarget(self, action: #selector(touchDown(sender:)), for: .touchDown)
        minusControl.addTarget(self, action: #selector(touchUp(sender:)), for: [.touchUpInside, .touchDragOutside])
        
        ratioLbl = UILabel()
        ratioLbl.text = "\(ratio)%"
        ratioLbl.textColor = .smokeGray
        ratioLbl.font = UIFont.monospacedSystemFont(ofSize: 14, weight: .medium)
        ratioLbl.textAlignment = .center
        addSubview(ratioLbl)
        ratioLbl.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
        
        NotificationCenter.default.addObserver(self, selector:#selector(becomeDeath(notification:)), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    @objc func touchDown(sender: UIButton) {
        stopUpdatingRatioLabel()
        startUpdatingRatioLabel(with: sender.tag - 500 != 0 )
    }
    
    @objc func touchUp(sender: UIButton) {
        stopUpdatingRatioLabel()
    }
    
    @objc func becomeDeath(notification: Notification){
       stopUpdatingRatioLabel()
    }
    
    func startUpdatingRatioLabel(with isPlus: Bool) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
            self.ratio += isPlus ? 1 : -1
            self.delegate?.zoomControlDidUpdateRatio(self, ratio: self.ratio)
        })
        timer?.fire()
    }
    
    func stopUpdatingRatioLabel() {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
