//
//  MapScreenViewController.swift
//  MeepTestMaps
//
//  Created by Miquel Bosch on 04/07/2019.
//  Copyright © 2019 Miquel Bosch. All rights reserved.
//

import UIKit
import APESuperHUD
import RxSwift
import RxCocoa

class MapScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
  }
  
  func showLoading() {
    APESuperHUD.show(style: HUDStyle.loadingIndicator(type: .standard), title: nil, message: "Fetching location...", completion: nil)
  }
  
  func hideLoading() {
   APESuperHUD.dismissAll(animated: true)
  }
}
