//
//  UIColor+extensions.swift
//  MeepTestMaps
//
//  Created by Miquel Bosch on 04/07/2019.
//  Copyright © 2019 Miquel Bosch. All rights reserved.
//

import UIKit

struct ColorPalette {
  struct Primary {
    static let lightOrange = UIColor(red:1.00, green:0.52, blue:0.32, alpha:1.0)
    
  }
}

// MARK: Color App Name
extension UIColor {
  static let mainColor = ColorPalette.Primary.lightOrange
}
