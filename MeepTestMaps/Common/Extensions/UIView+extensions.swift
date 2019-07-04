//
//  UIView+extensions.swift
//  MeepTestMaps
//
//  Created by Miquel Bosch on 04/07/2019.
//  Copyright © 2019 Miquel Bosch. All rights reserved.
//

import UIKit

extension UIView {
  func constraintToSuperView(_ superView: UIView) {
    self.translatesAutoresizingMaskIntoConstraints = false
    
    self.leftAnchor.constraint(equalTo: superView.leftAnchor).isActive = true
    self.rightAnchor.constraint(equalTo: superView.rightAnchor).isActive = true
    self.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
    self.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
  }
}
