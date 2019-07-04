//
//  ErrorView.swift
//  MeepTestMaps
//
//  Created by Miquel Bosch on 04/07/2019.
//  Copyright © 2019 Miquel Bosch. All rights reserved.
//

import UIKit

class ErrorView: UIView {
  @IBOutlet weak var lblError: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  func setErrorDescription(_ error: ErrorType) {
    var errorText = ""

    switch error {
    case .genericError:
      errorText = "Generic Error"
    case .noConnection:
      errorText = "No Connection"
    case .serverError:
      errorText = "Server Error"
    }
    
    lblError.text = errorText
  }
  
}
