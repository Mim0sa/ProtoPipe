//
//  PPLibraryToast.swift
//  ProtoPipe
//
//  Created by 吉乞悠 on 2020/7/28.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit
import SnapKit

class PPLibraryToast: PPToastViewController, UITextFieldDelegate {
    
    var searchTextField: UITextField!
    
    weak var delegate: PPToastViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toastNavigationBar.title = "Library"
        
        let searchIcon = UIView()
        let searchImage = UIImageView(frame: CGRect(x: 10, y: 10, width: 22, height: 22))
        searchImage.image = #imageLiteral(resourceName: "search")
        searchIcon.addSubview(searchImage)
        searchIcon.frame.size = CGSize(width: 34, height: 44)
        
        searchTextField = UITextField()
        searchTextField.delegate = self
        searchTextField.font = UIFont.systemFont(ofSize: 24)
        searchTextField.backgroundColor = .textFieldGray
        searchTextField.textColor = .subtitleWhite
        searchTextField.borderStyle = .roundedRect
        searchTextField.returnKeyType = .search
        searchTextField.spellCheckingType = .no
        searchTextField.leftView = searchIcon
        searchTextField.leftViewMode = .always
        contentView.addSubview(searchTextField)
        searchTextField.snp.makeConstraints { (make) in
            make.top.leading.equalTo(8)
            make.width.equalTo(preferredContentSize.width - 16)
            make.height.equalTo(44)
        }
    }
    
}
