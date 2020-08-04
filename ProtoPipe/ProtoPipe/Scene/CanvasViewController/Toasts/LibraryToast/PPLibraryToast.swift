//
//  PPLibraryToast.swift
//  ProtoPipe
//
//  Created by 吉乞悠 on 2020/7/28.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit
import SnapKit

class PPLibraryToast: PPToastViewController {
    
    weak var delegate: PPToastViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toastNavigationBar.title = "Library"
    }
    
}
