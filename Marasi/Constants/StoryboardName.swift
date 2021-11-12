//
//  StoryboardName.swift
//  Marasi
//
//  Created by Abdelrahman Hassan on 11/11/2021.
//

import Foundation

enum StoryboardName: String {
    case home
    case productDetails
    
    var fileName: String {
        return self.rawValue.prefix(1).uppercased() + self.rawValue.dropFirst()
    }
}
