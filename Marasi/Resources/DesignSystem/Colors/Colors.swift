//
//  Colors.swift
//  Marasi
//
//  Created by Abdelrahman Hassan on 12/11/2021.
//

import UIKit

extension DesignSystem {
    enum Colors: String {
        case actionTextPrimary = "ActionTextPrimary"
        case navBarBackgroundColor = "NavBarBackgroundColor"
        
        var color: UIColor {
            return UIColor(named: self.rawValue)!
        }
    }
}
