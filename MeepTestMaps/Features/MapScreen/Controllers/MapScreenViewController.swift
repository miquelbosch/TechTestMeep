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

class MapScreenViewController: UIViewController, LoadViewProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
      showMap()
      
  }
  
  func showLoading() {
    APESuperHUD.show(style: HUDStyle.loadingIndicator(type: .standard), title: nil, message: "Fetching location...", completion: nil)
  }
  
  func hideLoading() {
   APESuperHUD.dismissAll(animated: true)
  }
  
  func showMap() {
    if let mapView = self.loadView("MapView") {
      self.view.addSubview(mapView)
      //containerView = mapView
      
      mapView.translatesAutoresizingMaskIntoConstraints = false
      
      mapView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
      mapView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
      mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
      mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
  }
}
