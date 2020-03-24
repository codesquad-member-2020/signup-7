//
//  TextStyle.swift
//  SignUp
//
//  Created by Chaewan Park on 2020/03/24.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class TextStyle {
    enum Size: Int {
        case title = 30
        case regular = 14
        case button = 17
        case detail = 12
    }
    
    let size: Int
    let color: UIColor
    
    init?(size: Size, color: UIColor) {
        self.size = size.rawValue
        self.color = color
    }
}
