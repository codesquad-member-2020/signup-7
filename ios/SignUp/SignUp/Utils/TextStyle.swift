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
    
    enum Color: String {
        case black = "black"
        case placeholderGray = "textGray"
        case interestsWhite = "white"
        case invalidRed = "invalidRed"
        case suggestionGreen = "pointGreen"
    }
    
    let size: Int
    let color: UIColor
    
    init?(size: Size, color: Color) {
        guard let color = UIColor(named: color.rawValue) else { return nil }
        self.size = size.rawValue
        self.color = color
    }
}
