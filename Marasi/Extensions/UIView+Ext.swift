//
//  UIView+Ext.swift
//  Marasi
//
//  Created by Abdelrahman Hassan on 12/11/2021.
//

import UIKit

extension UIView {
    
    /// Adds the ability to configure the corner radius from the IB
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = true
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
}
