//
//  MapScreenViewModel.swift
//  MeepTestMaps
//
//  Created by Miquel Bosch on 04/07/2019.
//  Copyright © 2019 Miquel Bosch. All rights reserved.
//

import Foundation
import RxSwift

class MapScreenViewModel {
  private var networkManager = NetworkManager()
  public var tableDataList = PublishSubject<[LocationInfo]>()
  public let loadingManager = PublishSubject<LoadingType>()
  lazy var loadingObservable: Observable<LoadingType> = self.loadingManager.asObservable()
  
  

  
  
  
  
  public func fetchTransportList() {
    print(loadingManager)
    self.loadingManager.onNext(.loadingOn)
    networkManager.getTransportMarkers(success: { jsonResponse in
      //Pintar mapa
      self.loadingManager.onNext(.loadingOff)
      self.tableDataList.onNext(jsonResponse)
      
    }) { errorType in
      // pintar error
      self.loadingManager.onNext(.loadingOff)
    }
  }
}
