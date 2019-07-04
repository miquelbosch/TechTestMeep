//
//  Protocols.swift
//  MeepTestMaps
//
//  Created by Miquel Bosch on 04/07/2019.
//  Copyright © 2019 Miquel Bosch. All rights reserved.
//

import UIKit

protocol LoadViewProtocol {
  func loadView(_ nibName: String) -> UIView?
}

extension LoadViewProtocol {
  func loadView(_ nibName: String) -> UIView? {
    if nibName.isEmpty {
      return nil
    }
    if let view = UINib(nibName: nibName, bundle: nil).instantiate(withOwner: nil, options: nil).first as? UIView {
      return view
    }
    return nil
  }
}
