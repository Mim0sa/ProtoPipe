//
//  PPToastViewControllerDelegate.swift
//  ProtoPipe
//
//  Created by 吉乞悠 on 2020/6/18.
//  Copyright © 2020 吉乞悠. All rights reserved.
//

import UIKit

@objc protocol PPToastViewControllerDelegate: class {
    func toastViewControllerDidClickCancelBtn(_ toastViewController: PPToastViewController)
    
    // New File Toast
    @objc optional func newFileToastDidClickConfirmBtn(_ newFileToast: PPNewFileToast, newFileModel: NewFileModel)
    
    // Library Toast
    @objc optional func lilraryToastDidDragNode(_ libraryToast: PPLibraryToast)
}
