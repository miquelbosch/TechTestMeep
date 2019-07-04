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
  var mapScreenViewModel = MapScreenViewModel()
  var disposeBag =  DisposeBag()
  
  public let loadingManager = PublishSubject<LoadingType>()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bindObjects()
    showMap()
    mapScreenViewModel.fetchTransportList()
    
  }
  
  func bindObjects() {
    
    mapScreenViewModel
      .loadingObservable
      .subscribe(onNext: { [unowned self] haveToShow in
        if haveToShow == .loadingOn {
          self.showLoading()
        }else {
          self.hideLoading()
        }
        }
      ).disposed(by: disposeBag)
    
    
    
    
    
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
