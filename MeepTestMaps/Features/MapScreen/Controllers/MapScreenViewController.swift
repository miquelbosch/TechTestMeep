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
  var mapDelegate: MapView?
  
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
    
    mapScreenViewModel
      .tableDataList
      .subscribe(onNext: { [weak self] list in
        guard let map = self, let mapDel = map.mapDelegate else { return }
        mapDel.setMakers(list)
      }).disposed(by: disposeBag)
    
    
  }
  
  func showLoading() {
    APESuperHUD.show(style: HUDStyle.loadingIndicator(type: .standard), title: nil, message: "Fetching location...", completion: nil)
  }
  
  func hideLoading() {
    APESuperHUD.dismissAll(animated: true)
  }
  
  func showMap() {
    if let mapView = self.loadView("MapView") as? MapView {
      self.view.addSubview(mapView)
      mapDelegate = mapView
      mapView.constraintToSuperView(self.view)
    }
  }
  
  func showError() {
    if let mapView = self.loadView("ErrorView") as? ErrorView {
      self.view.addSubview(mapView)
      mapView.constraintToSuperView(self.view)
    }
  }
}
